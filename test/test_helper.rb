ENV['RAILS_ENV'] ||= 'test'

require 'database_cleaner/active_record'

DatabaseCleaner.strategy = :transaction


Rails.application.load_seed

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods

  setup do
    DatabaseCleaner.start
  end
  teardown do
    DatabaseCleaner.clean
  end
end