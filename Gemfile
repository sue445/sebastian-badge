source "https://rubygems.org"

ruby "2.4.0"

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
gem "activerecord", "~> 5.0.1", require: "active_record"

# Test requirements
gem "rspec", group: "test"
gem "rack-test", require: "rack/test", group: "test"

# Padrino Stable Gem
gem "padrino", "0.13.3.3"

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
gem "kaminari-sinatra", ">= 1.0.0"
gem "newrelic_rpm"
gem "rollbar"
gem "rroonga"
gem "sinatra", "~> 2.0.0.beta2"

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
  gem "rspec-padrino"
  gem "rspec-power_assert"
  gem "webmock"
end

group :production do
  gem "pg", group: :test
  gem "puma", group: :development
end
