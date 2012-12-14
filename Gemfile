source 'http://rubygems.org'

gem 'rails'

# Bundle edge Rails instead:
# gem 'rails', :git => 'git://github.com/rails/rails.git'

gem 'sqlite3'
gem "devise"#, "~> 1.4"
gem "devise_ldap_authenticatable"
gem "cancan"
gem 'will_paginate'
gem 'haml-rails'
gem 'jquery-rails'
gem 'awesome_nested_set'
gem 'simple_form'
gem 'rb-readline'
gem 'odf-report'
group :assets do
  gem 'sass-rails'
  gem 'coffee-rails'

  # See https://github.com/sstephenson/execjs#readme for more supported runtimes
  # gem 'therubyracer'

  #gem 'uglifier', '>= 1.0.3'
end
group :test do
  gem 'rspec-rails'
  gem 'shoulda-matchers'
  gem "factory_girl_rails"
end


# Use unicorn as the web server
gem 'unicorn'


# To use debugger (ruby-debug for Ruby 1.8.7+, ruby-debug19 for Ruby 1.9.2+)
# gem 'ruby-debug'
# gem 'ruby-debug19', :require => 'ruby-debug'

# Bundle the extra gems:
# gem 'bj'
# gem 'nokogiri'
# gem 'sqlite3-ruby', :require => 'sqlite3'
# gem 'aws-s3', :require => 'aws/s3'

# Bundle gems for the local environment. Make sure to
# put test-only gems in this group so their generators
# and rake tasks are available in development mode:
group :development do
  gem 'thin'
  gem 'webrat'
  gem 'rspec-rails'
  gem 'capistrano'	# Deploy with Capistrano
end
group :test do
  gem 'rspec-rails'
  gem 'webrat'
###  gem 'autotest'
##  gem 'factory_girl_rails'
end
