require "test_helper"

class RemoteCoffeeSlack::MembersTest  < Minitest::Test
  def setup
    @client = RemoteCoffeeSlack::SlackClient.new.client
  end

  def test_select_coffee_mates
    VCR.use_cassette 'select_coffee_mates' do
      coffee_mates = RemoteCoffeeSlack::Members.select_coffee_mates(@client)
      assert_equal 2, coffee_mates.count
    end
  end
end
