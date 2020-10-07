require "test_helper"

class RemoteCoffeeSlack::SessionNotifierTest  < Minitest::Test
  def setup
    @client = RemoteCoffeeSlack::SlackClient.new.client
  end

  def test_perform
    VCR.use_cassette 'notify_to_channel' do
      coffee_mates = [['@foo', '@bar'], ['@baz', '@test']]
      response = RemoteCoffeeSlack::SessionNotifier.perform(@client, coffee_mates)
      assert_message = 'The mates for the next coffee session are'
      assert_equal true, response.ok
      assert_match assert_message, response.message.text
    end
  end
end
