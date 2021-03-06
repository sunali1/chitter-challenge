ENV['RACK_ENV'] = 'test'
require File.join(File.dirname(__FILE__), '../app', 'app.rb')
require 'capybara/rspec'
require './app/app'
require 'web_helper'
require 'database_cleaner'
require 'orderly'
require_relative 'helpers/session'

require 'simplecov'
require 'simplecov-console'

Capybara.app = Chitter

RSpec.configure do |config|

  config.include SessionHelpers

end

SimpleCov.formatter = SimpleCov::Formatter::MultiFormatter.new([
  SimpleCov::Formatter::Console,
  # Want a nice code coverage website? Uncomment this next line!
  # SimpleCov::Formatter::HTMLFormatter
])
SimpleCov.start

RSpec.configure do |config|
  config.after(:suite) do
    puts
    puts "\e[33mHave you considered running rubocop? It will help you improve your code!\e[0m"
    puts "\e[33mTry it now! Just run: rubocop\e[0m"
  end
end
