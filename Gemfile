# frozen_string_literal: true

source "https://rubygems.org"

git_source(:github) { |repo_name| "https://github.com/#{repo_name}" }

gem 'pg'
gem 'sinatra'

gem 'capybara', group: :test
gem 'rspec', group: :test
gem 'simplecov', require: false, group: :test

group :development, :test do
  gem "rubocop", "0.79.0"
end

# gem "rails"
