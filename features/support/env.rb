require 'cucumber/rails'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require 'capybara/poltergeist'

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {debug: false, js_errors: false})
end

Capybara.javascript_driver = :poltergeist

Capybara.raise_server_errors = false

ActionController::Base.allow_rescue = false


begin
  DatabaseCleaner.strategy = :transaction
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation