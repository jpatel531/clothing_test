ENV['CODECLIMATE_REPO_TOKEN']='c12da6ab2d5645031f5d5cbaa9a73a31b01ba2c48846d57764778d7268fefa85'
require "codeclimate-test-reporter"
CodeClimate::TestReporter.start

require 'cucumber/rails'
require 'database_cleaner'
require 'database_cleaner/cucumber'
require 'capybara/poltergeist'
require 'selenium-webdriver'
require 'byebug'

Capybara.register_driver :selenium do |app|
  Capybara::Selenium::Driver.new(app, :browser => :chrome)
end

Capybara.register_driver :poltergeist do |app|
    Capybara::Poltergeist::Driver.new(app, {debug: false, js_errors: false, timeout: 600})
end

Capybara.javascript_driver = :poltergeist


Before do 
	create :product1 and create :product2 and create :product3
	create :voucher1 and create :voucher2 and create :voucher3
end

Capybara.raise_server_errors = false

ActionController::Base.allow_rescue = false

begin
  DatabaseCleaner.strategy = :truncation
rescue NameError
  raise "You need to add database_cleaner to your Gemfile (in the :test group) if you wish to use it."
end

Cucumber::Rails::Database.javascript_strategy = :truncation