source "https://rubygems.org"

git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.7.2"

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
gem "activerecord", "< 6.1.0", require: "active_record"
gem "sass"
gem "slim"

# Test requirements
gem "rack-test", require: "rack/test", group: "test"
gem "rspec", group: "test"

# Padrino Stable Gem
gem "padrino", ">= 0.15.0"

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
gem "nokogiri", ">= 1.11.0.rc4"
gem "puma"
gem "rollbar"

group :development do
  gem "annotate"
  gem "dotenv", group: :test
  gem "foreman"
  gem "onkcop", ">= 1.0.0.0", require: false
  gem "pry-byebug", group: :test
  gem "pry-padrino", group: :test
  gem "rubocop_auto_corrector", require: false
  gem "rubocop-performance", require: false
  gem "rubocop-rake", require: false
  gem "rubocop-rspec", ">= 2.0.0.pre", require: false
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
