# frozen_string_literal: true

source 'https://rubygems.org'

gem 'rails', '5.2.4.3'

gem 'bootsnap'

# Use SCSS for stylesheets
gem 'sass-rails', '~> 5.0'
# Use Uglifier as compressor for JavaScript assets
gem 'jquery-rails'
gem 'jquery-ui-rails', '5.0.5'
gem 'uglifier', '~> 4.1.0'

gem 'alphabetical_paginate'
gem 'cancancan', '~> 2.2'
gem 'devise', '>= 4.7.1'
gem 'devise_ldap_authenticatable'
gem 'will_paginate', '~> 3.0'
# gem 'execjs'
gem 'haml-rails'

gem 'acts-as-taggable-on', '>=6.5.0'
gem 'awesome_nested_set' # , :git => 'git://github.com/collectiveidea/awesome_nested_set'
gem 'chartkick', '>= 3.3.0'
gem 'groupdate'
gem 'jcrop-rails-v2'
gem 'odf-report'
gem 'paperclip', '~> 5.2.1'
gem 'public_activity'
gem 'rails3-jquery-autocomplete' # , git: 'https://github.com/francisd/rails3-jquery-autocomplete'
gem 'simple_form'
gem 'the_sortable_tree', '>= 2.4.0'
# gem 'pdf-reader'
gem 'pg'
gem 'pg_search'
gem 'tiny_tds', '~> 0.7.0' # MS SQL

gem 'tzinfo-data'

gem 'exception_notification'
gem 'whenever' # cron jobs (crontab -l, crontab -e)

gem 'faker'

gem 'loofah', '>= 2.5.0'
gem 'nokogiri', '>= 1.10.8'
gem 'rack', '>= 2.2.3'

gem 'rails_performance' # monitor the performance

group :development do
  gem 'better_errors', '>= 2.8.0'
  gem 'binding_of_caller'
  gem 'byebug'
  gem 'capistrano', '~>3.10.0'
  gem 'capistrano-bundler'
  gem 'capistrano-rails'
  gem 'capistrano-rvm'
  gem 'haml_lint', require: false
  # gem "rails-erd"
  gem 'brakeman', require: false
  gem 'bundler-audit', require: false
  gem 'capistrano-rails-db'
  gem 'capistrano3-puma'
  gem 'sshkit-sudo'
  # gem 'log-analyzer', require: false
  # gem 'rack-mini-profiler', require: ['enable_rails_patches']
end

group :production, :staging do
  gem 'puma', '>= 4.3.5'
  gem 'rails_12factor', require: false
end

group :test do
  gem 'capybara'
  gem 'codeclimate-test-reporter', '~> 1.0.0'
  gem 'codecov', require: false
  # gem 'database_cleaner'
  gem 'database_cleaner-active_record'
  gem 'rails-controller-testing'
  gem 'shoulda-matchers'
  gem 'simplecov'
  gem 'webrat'
end

group :development, :test do
  gem 'factory_bot_rails'
  gem 'rspec-rails'
  gem 'rubocop'
  gem 'rubocop-faker'
  gem 'rubocop-performance'
  gem 'rubocop-rails'
  gem 'rubocop-rspec'
  gem 'rubycritic'
  gem 'selenium-webdriver'
end
