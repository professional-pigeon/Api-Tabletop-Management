ENV['RAILS_ENV'] ||= 'test'

require 'database_cleaner/active_record'

Rails.application.load_seed

module SignInHelper
  def sign_in_as(user)
    post auth_login_path(user_name: user.user_name, password: 'mUc3m00RsqyRe')
  end

  # def sign_out
  #   get logout_path
  # end
end

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  DatabaseCleaner.strategy = :transaction

  setup do
    DatabaseCleaner.start
  end
  teardown do
    DatabaseCleaner.clean
  end
end

class ActionDispatch::IntegrationTest
  include FactoryBot::Syntax::Methods
  include SignInHelper
  DatabaseCleaner.strategy = :truncation

  setup do
    DatabaseCleaner.start
  end
  teardown do
    DatabaseCleaner.clean
  end

  def parsed_response
    parsed = JSON.parse(response.body)
    if parsed.is_a?(Hash)
      parsed.with_indifferent_access
    else
      parsed
    end
  end
end