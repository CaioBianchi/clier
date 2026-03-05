class ReviewsController < ApplicationController
  before_action :set_tool
  before_action :set_review, only: [ :destroy ]

  def create
    @review = @tool.reviews.build(review_params)
    @review.user = Current.user

    if @review.save
      redirect_to tool_path(@tool), notice: "Review was successfully created."
    else
      redirect_to tool_path(@tool), alert: "Failed to create review: #{@review.errors.full_messages.to_sentence}"
    end
  end

  def destroy
    if @review.user == Current.user || Current.user.admin?
      @review.destroy
      redirect_to tool_path(@tool), notice: "Review was successfully deleted."
    else
      redirect_to tool_path(@tool), alert: "You are not authorized to delete this review."
    end
  end

  private

  def set_tool
    @tool = Tool.find_by!(slug: params[:tool_id])
  end

  def set_review
    @review = @tool.reviews.find(params[:id])
  end

  def review_params
    params.require(:review).permit(:rating, :content)
  end
end
