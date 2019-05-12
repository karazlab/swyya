source 'https://rubygems.org'
git_source(:github) { |repo| "https://github.com/#{repo}.git" }

ruby '2.6.0'

gem 'rails', '~> 5.2.3'
gem 'pg', '>= 0.18', '< 2.0'
gem 'puma', '~> 3.11'
gem 'sass-rails', '~> 5.0'
gem 'uglifier', '>= 1.3.0'
gem 'turbolinks', '~> 5'
gem 'jbuilder', '~> 2.5'
gem 'bootsnap', '>= 1.1.0', require: false

group :development, :test do
  gem 'byebug', platforms: [:mri, :mingw, :x64_mingw]
  gem 'rspec-rails'
  gem 'shoulda-matchers', '4.0.0.rc1'
  gem 'rails-controller-testing' # If you are using Rails 5.x
  gem 'faker'
  gem 'factory_bot_rails'
end

group :development do
  gem 'web-console', '>= 3.3.0'
  gem 'listen', '>= 3.0.5', '< 3.2'
  gem 'spring'
  gem 'spring-watcher-listen', '~> 2.0.0'
  gem 'awesome_rails_console'
  gem 'guard-rspec', require: false
  gem 'letter_opener'
end

# Design
gem 'bootstrap', '~> 4.3.1'
gem 'jquery-rails'
gem 'font-awesome-sass', '~> 5.8.1'
gem 'haml'
gem 'haml-rails', '~> 2.0'
gem 'simple_form'

# User Configuration
gem 'country_select'
gem 'devise'
gem 'cancancan'
gem 'rolify'
gem 'paperclip', '~> 6.0.0'

# Config
gem 'friendly_id', '~> 5.2.4'
gem 'paper_trail'
gem 'acts_as_votable', '~> 0.12.0'
gem 'dotenv-rails', groups: [:development, :test]
gem 'mailgun-ruby', '~>1.1.6'
gem 'acts-as-taggable-on', '~> 6.0'
gem 'will_paginate', '~> 3.1.0'
gem 'meta-tags'

# Windows does not include zoneinfo files, so bundle the tzinfo-data gem
gem 'tzinfo-data', platforms: [:mingw, :mswin, :x64_mingw, :jruby]
