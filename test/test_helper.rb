ENV["RAILS_ENV"] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/reporters'

reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

include Warden::Test::Helpers
Warden.test_mode!

def test_password
  'testing12345'
end

def test_image
  Rails.root + 'test/resources/test.jpg'
end

def login(user)
  visit root_path
  click_link 'Login'

  within '#login' do
    fill_in :user_email, with: user.email
    fill_in :user_password, with: test_password
    click_button 'Log In'
  end

end

DatabaseCleaner.strategy = :transaction

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods

  before :each do
    DatabaseCleaner.start
  end

  after :each do
    DatabaseCleaner.clean
  end
end
