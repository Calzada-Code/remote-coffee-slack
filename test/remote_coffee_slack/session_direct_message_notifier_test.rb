require "test_helper"

class RemoteCoffeeSlack::SessionDirectMessageNotifierTest < Minitest::Test
  def setup
    @client = RemoteCoffeeSlack::SlackClient.new.client
  end

  def test_perform
    VCR.use_cassette 'notify_via_dm' do
      coffee_mates = [["U01CAG57LHF", "U01BUQEUERK"], ["U01BU05V213", "U01BQAND5N2"]]

      assert RemoteCoffeeSlack::SessionDirectMessageNotifier.perform(@client, coffee_mates)
    end
  end
end
