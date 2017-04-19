# frozen_string_literal: true

# This file is copied to spec/ when you run 'rails generate rspec:install'
ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
abort('The Rails environment is running in production mode!') if Rails.env.production?
require 'spec_helper'
require 'rspec/rails'
require 'paperclip/matchers'
# require 'shoulda/matchers'
# require 'capybara/rails'
require 'public_activity/testing'

Dir[Rails.root.join('spec/support/**/*.rb')].each { |f| require f }

# Checks for pending migrations before tests are run.
# If you are not using ActiveRecord, you can remove this line.
ActiveRecord::Migration.maintain_test_schema!

RSpec.configure do |config|
  # config.include Features, type: :feature
  config.include FactoryGirl::Syntax::Methods
  # config.include Paperclip::Shoulda::Matchers
  # config.include Devise::Test::ControllerHelpers, type: :controller

  config.before(:suite) do
    DatabaseCleaner.strategy = :transaction
    DatabaseCleaner.clean_with(:truncation)
  end

  config.fixture_path = "#{::Rails.root}/spec/fixtures"

  config.alias_example_to :bulletify, bullet: true

  config.use_transactional_fixtures = true

  config.filter_rails_from_backtrace!

  config.infer_spec_type_from_file_location!
end

PublicActivity.enabled = false

Shoulda::Matchers.configure do |config|
  config.integrate do |with|
    with.test_framework :rspec
    with.library :rails
  end
end

RSpec.configure do |config|
  config.include Paperclip::Shoulda::Matchers
end

RSpec.configure do |config|
  config.include Devise::TestHelpers, type: :controller
  config.include ControllerHelpers, type: :controller
end
