require 'test_helper'

class FavoriteTest < ActiveSupport::TestCase
  test 'should be valid with user and tool' do
    favorite = Favorite.new(user: users(:one), tool: tools(:one))
    assert favorite.valid?
  end

  test 'should require user' do
    favorite = Favorite.new(tool: tools(:one))
    assert_not favorite.valid?
  end

  test 'should require tool' do
    favorite = Favorite.new(user: users(:one))
    assert_not favorite.valid?
  end
end
