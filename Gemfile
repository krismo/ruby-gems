source 'https://rubygems.org'

# ruby '>=2.4.0'

gem 'cucumber', require: %w[pp etc]
gem 'activesupport', require: 'active_support/core_ext/hash/conversions'
gem 'colorize'
gem 'minitest'
gem 'awesome_print'
gem 'parallel_tests'
gem 'test-unit', require: ['test/unit/assertions', 'test/unit', 'test/unit/ui/console/testrunner']
gem 'byebug'
gem 'tiny_tds'

group :api do
  gem 'ffi'
  gem 'rest-client'
  gem 'json'
  gem 'json-schema'
  gem 'yajl-ruby', require: 'yajl'
  gem 'jsonpath'
  gem 'json-compare'
  gem 'aws-sdk'
  gem 'hashie'
  gem 'smarter_csv'
  gem 'differ'
  gem 'terminal-table'
  gem 'activerecord'
  gem 'redshift-client'
  gem 'nokogiri'
  gem 'htmlentities'
  gem 'mocha', require: 'mocha/test_unit'
  gem 'mysql2'
end

group :ui do
  gem 'selenium-webdriver'
  gem 'capybara', require: 'capybara/cucumber'
  gem 'capybara-screenshot', require: 'capybara-screenshot/cucumber'
  gem 'site_prism', require: 'site_prism'
  gem 'poltergeist', require: 'capybara/poltergeist'
  gem 'webdriver-highlighter'
  gem 'mini_magick'
end

group :git do
  gem 'octokit'
end
