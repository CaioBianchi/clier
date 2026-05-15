require 'test_helper'

class UserTest < ActiveSupport::TestCase
  test 'downcases and strips email_address' do
    user = User.new(email_address: ' DOWNCASED@EXAMPLE.COM ')
    assert_equal('downcased@example.com', user.email_address)
  end

  test 'should be valid with valid attributes' do
    user = User.new(email_address: 'test@example.com', password: 'password', first_name: 'John', last_name: 'Doe')
    assert user.valid?
  end

  test 'should require email' do
    user = User.new(password: 'password')
    assert_not user.valid?
  end

  test 'has many favorites and tools' do
    user = users(:one)
    assert_respond_to user, :favorites
    assert_respond_to user, :tools
  end
end
