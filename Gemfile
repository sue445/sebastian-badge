source "https://rubygems.org"

git_source(:github) {|repo| "https://github.com/#{repo}.git" }

ruby "2.7.6"

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

# FIXME: rspec-padrino doesn't work with rack-test v2.0.0+
# https://app.circleci.com/pipelines/github/sue445/sebastian-badge/1606/workflows/0bf61ca4-d65a-45dd-8af1-719330f675c9/jobs/5314
#   1) /plugins GET /plugins/:name
#      Failure/Error: last_application.assigns(name)
#
#      NoMethodError:
#        undefined method `last_application' for nil:NilClass
#      # ./vendor/bundle/ruby/2.7.0/gems/rspec-padrino-0.3.0/lib/rspec/padrino/methods.rb:5:in `last_application'
#      # ./spec/support/test_utils.rb:19:in `assigns'
#      # ./spec/app/controllers/plugins_controller_spec.rb:9:in `block (3 levels) in <top (required)>'
#      # ./vendor/bundle/ruby/2.7.0/gems/webmock-3.14.0/lib/webmock/rspec.rb:37:in `block (2 levels) in <top (required)>'
gem "rack-test", "< 2.0.0", require: "rack/test", group: "test"

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
