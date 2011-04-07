require 'rubygems'
require 'spork'

Spork.prefork do
  # Sets up the Rails environment for Cucumber
  ENV["RAILS_ENV"] ||= "test"
  require File.expand_path(File.dirname(__FILE__) + '/../../config/environment')

  require 'capybara/rails'
  require 'capybara/cucumber'
  require 'capybara/session'

  # Webrat.configure do |config|
  #   config.mode = :rails
  # end

  #require 'webrat/core/matchers'
  require 'cucumber'  # I needed to add this... We could move this require to Spork if we think it is better there...
  require 'cucumber/formatter/unicode' # Comment out this line if you don't want Cucumber Unicode support
  # require 'spec/rails'  # I needed to add this as well to avoid the #records error...
  require 'cucumber/rails/rspec'
  
  Capybara.default_selector = :css
  Capybara.javascript_driver = :selenium
end

Spork.each_run do
  # This code will be run each time you run your specs.
  require 'cucumber/rails/world'
  # ActionController::Base.allow_rescue = false
  # Cucumber::Rails.use_transactional_fixtures
  # Cucumber::Rails.bypass_rescue # Comment out this line if you want Rails own error handling 
                                # (e.g. rescue_action_in_public / rescue_responses / rescue_from)
                                
  if defined?(ActiveRecord::Base)
    begin
      require 'database_cleaner'
      DatabaseCleaner.strategy = :truncation
    rescue LoadError => ignore_if_database_cleaner_not_present
    end
  end
end