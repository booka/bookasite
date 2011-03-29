require 'test_helper'
require 'capybara'
require 'capybara/dsl'
require 'database_cleaner'

Capybara.app = Bookasite::Application
Capybara.default_driver = :rack_test
DatabaseCleaner.strategy = :truncation

class SeriesControllerTest < ActionController::TestCase
  include Capybara
  self.use_transactional_fixtures = false

  setup do
    DatabaseCleaner.start
    @serie1 = Serie.create(:title => 'serie1', :icon_path => 'icon.png')
  end

  teardown do
    DatabaseCleaner.clean
  end

  test 'should get series' do
    visit series_path(@serie1)
    assert_response :success
    assert page.has_content?('serie1')
  end


end