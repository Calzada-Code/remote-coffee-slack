source "https://rubygems.org"

# Specify your gem's dependencies in remote_coffee_slack.gemspec
gemspec

gem "rake", "~> 12.0"

group :test do
  gem "minitest", "~> 5.0"
  gem 'vcr'
  gem 'webmock'
end

group :test, :development do
  gem "pry"
  gem 'dotenv', "~> 2.7.6"
end
