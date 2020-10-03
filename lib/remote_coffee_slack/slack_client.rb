require 'slack-ruby-client'

module RemoteCoffeeSlack
  class SlackClient
    attr_reader :client

    def initialize
      ::Slack.configure do |config|
        config.token = RemoteCoffeeSlack.config.slack_bot_token
        raise 'Missing API token' unless config.token
      end

      @client = Slack::Web::Client.new
    end
  end
end
