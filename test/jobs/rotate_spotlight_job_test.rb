require 'test_helper'

class RotateSpotlightJobTest < ActiveJob::TestCase
  test 'sets a spotlight tool' do
    Tool.update_all(spotlighted: false)
    assert_nil Tool.spotlighted.first

    RotateSpotlightJob.perform_now

    assert_not_nil Tool.spotlighted.first
  end

  test 'ensures only one tool is spotlighted at a time' do
    tool1 = tools(:one)
    tool2 = tools(:two)

    Tool.set_spotlight!(tool1)
    assert tool1.reload.spotlighted?
    assert_not tool2.reload.spotlighted?

    Tool.set_spotlight!(tool2)
    assert_not tool1.reload.spotlighted?
    assert tool2.reload.spotlighted?
  end
end
