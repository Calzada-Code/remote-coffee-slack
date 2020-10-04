$LOAD_PATH.unshift File.expand_path("../lib", __dir__)
require "remote_coffee_slack"
require 'dotenv/load'
require 'pry'
require 'vcr'

require "minitest/autorun"

RemoteCoffeeSlack.configure do |config|
  config.slack_bot_token = ENV['SLACK_BOT_TOKEN']
  config.slack_channel = ENV['SLACK_CHANNEL']
end

VCR.configure do |config|
  config.cassette_library_dir = 'test/vcr_cassettes'
  config.hook_into :webmock

  # Let's you set default VCR mode with VCR=all for re-recording
  # episodes. :once is VCR default.
  # to record again an API call just set VCR=all
  # spec your_test_file_spec.rb:line number
  record_mode = ENV['VCR'] ? ENV['VCR'].to_sym : :once
  config.default_cassette_options = { record: record_mode }
end
