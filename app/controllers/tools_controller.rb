require 'net/http'

class ToolsController < ApplicationController
  allow_unauthenticated_access

  def index
    @spotlight_tool = Tool.spotlighted.first
    @categories = Tool.group(:category)
                      .order('count_all DESC')
                      .count
                      .keys
                      .compact

    @tools = filtered_tools.order(github_stars: :desc, name: :asc)
                           .page(params[:page])
                           .per(10)

    respond_to do |format|
      format.html
      format.turbo_stream
    end
  end

  def show
    @tool = Tool.find_by!(slug: params[:id])

    if turbo_frame_request?
      @readme_html = @tool.readme_html

      # Fallback to fetch live if it's missing (before the job runs)
      if @readme_html.blank?
        @readme_html = fetch_readme_html(@tool)
        # Optionally save it so subsequent clicks are fast
        @tool.update(readme_html: @readme_html) if @readme_html.present?
      end
    else
      # For direct visits, render the index with the modal open
      index
      render :index
    end
  end

  def destroy
    @tool = Tool.find_by!(slug: params[:id])
    if authenticated? && Current.user.admin?
      @tool.destroy
      redirect_to tools_path, notice: 'Tool was successfully deleted.'
    else
      redirect_to tool_path(@tool), alert: 'You are not authorized to delete this tool.'
    end
  end

  def spotlight
    @tool = Tool.find_by!(slug: params[:id])
    if authenticated? && Current.user.admin?
      Tool.set_spotlight!(@tool)
      redirect_to tools_path, notice: "#{@tool.name} is now the spotlighted tool."
    else
      redirect_to tool_path(@tool), alert: 'You are not authorized to perform this action.'
    end
  end

  private

  def fetch_readme_html(tool)
    repo = extract_github_repo(tool.github_url)
    return unless repo

    uri = URI("https://api.github.com/repos/#{repo}/readme")

    request = Net::HTTP::Get.new(uri).tap do |req|
      req['Accept'] = 'application/vnd.github.html'
      req['User-Agent'] = 'Clier-App'

      github_token = github_token()
      req['Authorization'] = "Bearer #{github_token}" if github_token.present?
    end

    response = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
      http.request(request)
    end

    response.body if response.is_a?(Net::HTTPSuccess)
  end

  def extract_github_repo(url)
    return if url.blank?

    url.split('github.com/').last
  end

  def github_token
    ENV['GITHUB_TOKEN'].presence || `gh auth token 2>/dev/null`.strip.presence
  end

  def filtered_tools
    tools = favorite_tools? ? Current.user.tools : Tool.all

    tools = tools.where(category: params[:category]) if params[:category].present?
    tools = tools.where(search_query, *search_values) if params[:query].present?

    tools
  end

  def favorite_tools?
    params[:favorites].present? && authenticated?
  end

  def search_query
    <<~SQL.squish
      name ILIKE ? OR
      description ILIKE ? OR
      category ILIKE ?
    SQL
  end

  def search_values
    term = "%#{params[:query]}%"
    [term, term, term]
  end
end
