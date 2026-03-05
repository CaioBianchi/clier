require "test_helper"

class ReviewsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @tool = tools(:one)
    @user = users(:one)
    @other_user = users(:two)
    @review = reviews(:one)
  end

  test "should not create review if unauthenticated" do
    assert_no_difference("Review.count") do
      post tool_reviews_url(@tool), params: { review: { rating: 5, content: "Great tool!" } }
    end
    assert_redirected_to new_session_url
  end

  test "should create review if authenticated" do
    sign_in_as(@user)
    assert_difference("Review.count", 1) do
      post tool_reviews_url(@tool), params: { review: { rating: 5, content: "Great tool!" } }
    end
    assert_redirected_to tool_url(@tool)
  end

  test "should not destroy review if unauthenticated" do
    assert_no_difference("Review.count") do
      delete tool_review_url(@tool, @review)
    end
    assert_redirected_to new_session_url
  end

  test "should destroy own review" do
    sign_in_as(@review.user)
    assert_difference("Review.count", -1) do
      delete tool_review_url(@tool, @review)
    end
    assert_redirected_to tool_url(@tool)
  end

  test "should not destroy other users review" do
    sign_in_as(@other_user)
    assert_no_difference("Review.count") do
      delete tool_review_url(@tool, @review)
    end
    assert_redirected_to tool_url(@tool)
    assert_equal "You are not authorized to delete this review.", flash[:alert]
  end
end
