require "test_helper"

class RemoteCoffeeSlackTest < Minitest::Test
  def test_default_configuration
    config = RemoteCoffeeSlack::Configuration.new
    assert_equal config.slack_channel, '#general'
  end
end
