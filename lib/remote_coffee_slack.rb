require "remote_coffee_slack/version"

require "remote_coffee_slack/slack_client"
require "remote_coffee_slack/members"
require "remote_coffee_slack/session_notifier"

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

  def self.select_coffee_mates
    @select_coffee_mates ||= Members.select_coffee_mates(slack_client)
  end

  def self.notify_next_session
    SessionNotifier.perform(slack_client, select_coffee_mates)
  end

  class Configuration
    DEFAULT_SLACK_CHANNEL = '#general'.freeze

    attr_accessor :slack_bot_token, :members_per_group
    attr_writer :slack_channel

    def slack_channel
      @slack_channel || DEFAULT_SLACK_CHANNEL
    end
  end
end
