ENV["RAILS_ENV"] = "test"
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

require 'capybara'
require 'capybara/dsl'
require 'database_cleaner'


class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.(yml|csv) for all tests in alphabetical order.
  #
  # Note: You'll currently still have to declare fixtures explicitly in integration tests
  # -- they do not yet inherit this setting
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

Capybara.app = Bookasite::Application
Capybara.default_driver = :rack_test
DatabaseCleaner.strategy = :truncation


class ControllerTest < ActionController::TestCase
  include Capybara
  self.use_transactional_fixtures = false

  setup do
    DatabaseCleaner.start

  end

  teardown do
    DatabaseCleaner.clean
  end
end
