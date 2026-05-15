require 'net/http'

class ToolsController < ApplicationController
  allow_unauthenticated_access

  def index
    @spotlight_tool = Tool.spotlighted.first
    @categories = Tool.group(:category).order('count_all DESC').count.keys.compact
    @tools = Tool.order(github_stars: :desc, name: :asc)

    @tools = Current.user.tools.order(github_stars: :desc, name: :asc) if params[:favorites].present? && authenticated?

    @tools = @tools.where(category: params[:category]) if params[:category].present?

    if params[:query].present?
      search_term = "%#{params[:query]}%"
      @tools = @tools.where('name ILIKE ? OR description ILIKE ? OR category ILIKE ?', search_term, search_term,
                            search_term)
    end

    @tools = @tools.page(params[:page]).per(10)

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
    return nil unless tool.github_url.present?

    repo = tool.github_url.split('github.com/').last
    return unless repo

    uri = URI("https://api.github.com/repos/#{repo}/readme")
    req = Net::HTTP::Get.new(uri)
    req['Accept'] = 'application/vnd.github.html'
    req['User-Agent'] = 'Clier-App'

    token = ENV['GITHUB_TOKEN'] || `gh auth token 2>/dev/null`.strip
    req['Authorization'] = "Bearer #{token}" if token.present?

    begin
      res = Net::HTTP.start(uri.hostname, uri.port, use_ssl: true) do |http|
        http.request(req)
      end

      res.body if res.is_a?(Net::HTTPSuccess)
    end
  end
end
