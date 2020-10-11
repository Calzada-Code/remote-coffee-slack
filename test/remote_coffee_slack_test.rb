require "test_helper"

class RemoteCoffeeSlackTest < Minitest::Test
  def test_default_configuration
    config = RemoteCoffeeSlack::Configuration.new
    assert_equal '#general', config.slack_channel
  end

  def test_configuration
    config = RemoteCoffeeSlack::Configuration.new
    config.slack_channel = '#new_channel'
    assert_equal '#new_channel', config.slack_channel
  end
end
