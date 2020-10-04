module RemoteCoffeeSlack
  class Members
    MATES_PER_GROUP = 2

    def initialize(client)
      @client = client
      @members = retrieve_all_members
    end

    def self.select_coffee_mates(client)
      new(client).select_coffee_mates
    end

    def select_coffee_mates
      members_handlers.shuffle.each_slice(MATES_PER_GROUP).to_a
    end

    private

    attr_reader :client, :members

    def retrieve_all_members
      all_members = []

      client.users_list(presence: true, limit: 10, sleep_interval: 5, max_retries: 20) do |response|
        all_members.concat(response.members)
      end

      all_members
    end

    def members_handlers
    members.map do |member|
      "@#{member.id}|#{member.name}"
    end
    end
  end
end
