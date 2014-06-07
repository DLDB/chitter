ENV['RACK_ENV'] = 'test'
require_relative '../app/server'
require 'database_cleaner'
require 'capybara'
require 'rspec'
require 'factory_girl'
require_relative './factories/user'

RSpec.configure do |config|
  config.include Capybara::DSL
  config.include FactoryGirl::Syntax::Methods

  config.treat_symbols_as_metadata_keys_with_true_values = true
  config.run_all_when_everything_filtered = true
  config.filter_run :focus
  config.order = 'random'

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.before(:each) do
    DatabaseCleaner.start
  end

  config.after(:each) do
    DatabaseCleaner.clean
  end

end
