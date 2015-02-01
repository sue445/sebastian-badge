source "https://rubygems.org"

ruby "2.2.0"

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
gem "activerecord", ">= 3.1", require: "active_record"

# Test requirements
gem "rspec", group: "test"
gem "rack-test", require: "rack/test", group: "test"

# Padrino Stable Gem
gem "padrino", "0.12.4"

# Or Padrino Edge
# gem 'padrino', :github => 'padrino/padrino-framework'

# Or Individual Gems
# %w(core support gen helpers cache mailer admin).each do |g|
#   gem 'padrino-' + g, '0.12.4'
# end

gem "activerecord-import"
gem "dalli"
gem "kaminari", require: "kaminari/sinatra"
gem "rollbar", "~> 1.3.1"
gem "sinatra", github: "sinatra"

group :development do
  gem "annotate"
  gem "foreman"
  gem "rubocop"
  gem "sqlite3", group: :test
end

group :test do
  gem "coveralls", require: false
  gem "database_rewinder"
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
