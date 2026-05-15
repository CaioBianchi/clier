class RotateSpotlightJob < ApplicationJob
  queue_as :default

  def perform(*_args)
    tool = Tool.order('RANDOM()').first
    Tool.set_spotlight!(tool) if tool
  end
end
