class FavoritesController < ApplicationController
  def create
    @tool = Tool.find(params[:tool_id])
    Current.user.favorites.find_or_create_by(tool: @tool)

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.turbo_stream
    end
  end

  def destroy
    @tool = Tool.find(params[:tool_id])
    Current.user.favorites.find_by(tool: @tool)&.destroy

    respond_to do |format|
      format.html { redirect_back fallback_location: root_path }
      format.turbo_stream
    end
  end
end
