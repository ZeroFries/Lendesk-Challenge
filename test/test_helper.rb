ENV["RAILS_ENV"] ||= "test"
require_relative "../config/environment"
require "rails/test_help"

Dir[Rails.root.join("test", "interactors", "**", "*.rb")].each { |file| require file }

class ActiveSupport::TestCase
  # Run tests in parallel with specified workers
  parallelize(workers: :number_of_processors)

  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  teardown do
    # clear Redis between tests
    Redis.new(url: 'redis://127.0.0.1:6379/2').flushdb
  end

  # Add more helper methods to be used by all tests here...
end
