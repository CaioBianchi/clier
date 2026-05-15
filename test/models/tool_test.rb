require 'test_helper'

class ToolTest < ActiveSupport::TestCase
  test 'should be valid with valid attributes' do
    tool = Tool.new(name: 'TestTool', category: 'Utility', github_url: 'https://github.com/test/test')
    assert tool.valid?
  end

  test 'has many favorites and users' do
    tool = tools(:one)
    assert_respond_to tool, :favorites
    assert_respond_to tool, :users
  end
end
