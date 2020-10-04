module RemoteCoffeeSlack
  class SessionNotifier
    def initialize(client, coffee_mates)
      @client = client
      @coffee_mates = coffee_mates
    end

    def perform
      client.chat_postMessage(channel: '#general', text: next_session_message, as_user: true)
    end

    def self.perform(client, coffee_mates)
      new(client, coffee_mates).perform
    end

    private

    attr_reader :client, :coffee_mates

    def next_session_message
      <<-TEXT
      The mates for the next coffee session are:
      #{coffee_mates_formated}
      TEXT
    end

    def coffee_mates_formated
      coffee_mates.map do |mates|
        "<#{mates.first}> and <#{mates.last}>\n"
      end.join
    end
  end
end
