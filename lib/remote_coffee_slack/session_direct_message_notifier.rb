module RemoteCoffeeSlack
  class SessionDirectMessageNotifier
    def initialize(client, coffee_mates)
      @client = client
      @coffee_mates = coffee_mates
    end

    def perform
      conversation_channels.each do |channel_id|
        client.chat_postMessage(
          channel: channel_id,
          text: next_session_message,
          as_user: true)
      end

      true
    end

    def self.perform(client, coffee_mates)
      new(client, coffee_mates).perform
    end

    private

    attr_reader :client, :coffee_mates

    def conversation_channels
      coffee_mates.map do |mates|
        client.conversations_open({ users: mates.join(',') }).channel.id
      end
    end

    def next_session_message
      <<-TEXT
      Hello! you have been selected for the next remote coffee session.
      TEXT
    end
  end
end
