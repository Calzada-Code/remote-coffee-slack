require "test_helper"

class RemoteCoffeeSlack::SlackClientTest  < Minitest::Test
  def test_client
    client = RemoteCoffeeSlack::SlackClient.new.client

    assert_equal Slack::Web::Client, client.class
  end
end
