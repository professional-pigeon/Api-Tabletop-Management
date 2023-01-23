ENV['RAILS_ENV'] ||= 'test'

require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :truncation


Rails.application.load_seed

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  teardown do
    DatabaseCleaner.clean
  end
end