ENV['RAILS_ENV'] ||= 'test'

class ActiveSupport::TestCase
  include FactoryBot::Syntax::Methods
  setup do
    # In some instances, in particular generating commodity names,
    # Faker simply runs out of unique fruit names and raises an Exception.
    # Clearing it in the setup phase of every test instance seems to
    # avoid this.
    Faker::UniqueGenerator.clear
  end
end