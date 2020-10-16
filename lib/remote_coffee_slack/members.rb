module RemoteCoffeeSlack
  class Members
    MATES_PER_GROUP = 2

    def initialize(client)
      @client = client
      @members = retrieve_channel_members
    end

    def self.select_coffee_mates(client)
      new(client).select_coffee_mates
    end

    def select_coffee_mates
      human_members.shuffle.each_slice(members_per_group).to_a
    end

    private

    attr_reader :client, :members

    def retrieve_channel_members
      channel_members = []
      params = {
        channel: RemoteCoffeeSlack.config.slack_channel,
        limit: 10,
        sleep_interval: 5,
        max_retries: 20
      }

      client.conversations_members(params) do |response|
        channel_members.concat(response.members)
      end

      channel_members
    end

    def human_members
    members.reject do |member|
      client.users_info(user: member).user.is_bot
    end
    end

    def members_per_group
      RemoteCoffeeSlack.config.members_per_group || MATES_PER_GROUP
    end
  end
end
