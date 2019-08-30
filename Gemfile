source "https://rubygems.org"

git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.6.4"

# Distribute your app as a gem
# gemspec

# Server requirements
# gem 'thin' # or mongrel
# gem 'trinidad', :platform => 'jruby'

# Optional JSON codec (faster performance)
# gem 'oj'

# Project requirements
gem "rake"

# Component requirements
gem "activerecord", ">= 5.2.0", require: "active_record"
gem "sass"
gem "slim"

# Test requirements
gem "rack-test", require: "rack/test", group: "test"
gem "rspec", group: "test"

# Padrino Stable Gem
# gem "padrino"

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

gem "padrino", ">= 0.14.4"

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.4'
# end

gem "activerecord-simple_index_name"
gem "bundler"
gem "dalli"
gem "kaminari-activerecord", ">= 1.0.0"
gem "kaminari-sinatra", ">= 1.0.0", require: false
gem "newrelic_rpm"
gem "puma"
gem "puma-heroku"
gem "rollbar"
gem "rroonga", "6.1.3" # When use v7.0.2, Heroku deploy is failure

group :development do
  gem "annotate"
  gem "dotenv", group: :test
  gem "foreman"

  # TODO: Remove after https://github.com/onk/onkcop/pull/62 and https://github.com/onk/onkcop/pull/63 are merged
  # gem "onkcop", ">= 0.53.0.3", require: false
  gem "onkcop", require: false, github: "sue445/onkcop", branch: "rubocop_0.72.0"

  gem "pry-byebug", group: :test
  gem "pry-padrino", group: :test
  gem "rubocop-performance", require: false
  gem "sqlite3", group: :test
end

group :test do
  gem "coveralls", require: false
  gem "database_rewinder"
  gem "factory_bot"
  gem "faker-precure"
  gem "rspec-its"
  gem "rspec-padrino"
  gem "rspec-power_assert"
  gem "webmock"
end

group :production do
  gem "pg", ">= 1.0.0", group: :test
end
