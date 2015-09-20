ENV["RAILS_ENV"] = 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'
require 'minitest/rails'
require 'minitest/rails/capybara'
require 'minitest/reporters'


reporter_options = { color: true }
Minitest::Reporters.use! [Minitest::Reporters::DefaultReporter.new(reporter_options)]

# MiniTest
class MiniTest::Unit::TestCase
  include FactoryGirl::Syntax::Methods
end

# MiniTest::Spec
class MiniTest::Spec
  include FactoryGirl::Syntax::Methods
end

class ActiveSupport::TestCase
  include FactoryGirl::Syntax::Methods
end

include Warden::Test::Helpers
Warden.test_mode!

# To add Capybara feature tests add `gem "minitest-rails-capybara"`
# to the test group in the Gemfile and uncomment the following:
# require "minitest/rails/capybara"

# Uncomment for awesome colorful output
# require "minitest/pride"

#class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
 # fixtures :all
  # Add more helper methods to be used by all tests here...
#end
