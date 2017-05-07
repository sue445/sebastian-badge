source "https://rubygems.org"

ruby "2.4.1"

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
gem "sass"
gem "slim"
gem "activerecord", require: "active_record"

# Test requirements
gem "rspec", group: "test"
gem "rack-test", require: "rack/test", group: "test"

# Padrino Stable Gem
gem "padrino", "~> 0.14.0.1"

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

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
gem "rollbar"
gem "rroonga", "6.1.3" # When use v7.0.2, Heroku deploy is failure
gem "sinatra", "2.0.0.rc2"

group :development do
  gem "annotate"
  gem "dotenv", group: :test
  gem "foreman"
  gem "pry-byebug", group: :test
  gem "pry-padrino", group: :test
  gem "rubocop", "0.36.0"
  gem "sqlite3", group: :test
end

group :test do
  gem "coveralls", require: false
  gem "database_cleaner"
  gem "factory_girl"
  gem "faker-precure"
  gem "rspec-its"
  gem "rspec-padrino", github: "sue445/rspec-padrino", branch: "padrino-0.14", ref: "ec42ea"
  gem "rspec-power_assert"
  gem "webmock"
end

group :production do
  gem "pg", group: :test
  gem "puma", group: :development
end
