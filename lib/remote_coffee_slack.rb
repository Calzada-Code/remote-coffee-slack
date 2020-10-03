require "remote_coffee_slack/version"

require "remote_coffee_slack/slack_client"

module RemoteCoffeeSlack
  class << self
    attr_accessor :config
    attr_accessor :slack_client
  end

  def self.configure
    self.config ||= Configuration.new
    yield config
  end

  def self.slack_client
    @slack_client ||= SlackClient.new.client
  end

  class Configuration
    attr_accessor :slack_bot_token
  end
end
