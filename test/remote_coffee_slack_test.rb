require "test_helper"

class RemoteCoffeeSlackTest < Minitest::Test
  def test_default_configuration
    config = RemoteCoffeeSlack::Configuration.new
    assert_equal config.slack_channel, '#general'
  end

  def test_configuration
    config = RemoteCoffeeSlack::Configuration.new
    config.slack_channel = '#new_channel'
    assert_equal config.slack_channel, '#new_channel'
  end
end
