require 'test_helper'

class ReviewTest < ActiveSupport::TestCase
  setup do
    @review = reviews(:one)
  end

  test 'should be valid' do
    assert @review.valid?
  end

  test 'rating should be present' do
    @review.rating = nil
    assert_not @review.valid?
  end

  test 'rating should be between 1 and 5' do
    @review.rating = 0
    assert_not @review.valid?

    @review.rating = 6
    assert_not @review.valid?

    @review.rating = 3
    assert @review.valid?
  end

  test 'content should be present' do
    @review.content = '   '
    assert_not @review.valid?
  end

  test 'should belong to tool' do
    assert_respond_to @review, :tool
    assert_instance_of Tool, @review.tool
  end

  test 'should belong to user' do
    assert_respond_to @review, :user
    assert_instance_of User, @review.user
  end
end
