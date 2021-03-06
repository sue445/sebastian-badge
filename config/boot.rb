# Defines our constants
RACK_ENV = ENV["RACK_ENV"] ||= "development" unless defined?(RACK_ENV)
PADRINO_ROOT = File.expand_path("..", __dir__) unless defined?(PADRINO_ROOT)

# Load our dependencies
require "rubygems" unless defined?(Gem)
require "bundler/setup"
Bundler.require(:default, RACK_ENV)

# After `require "kaminari/sinatra"`, "Rails" module is defined in rails-html-sanitizer
# https://github.com/rails/rails-html-sanitizer/blob/v1.0.3/lib/rails/html/sanitizer.rb#L1
# error occurred following
# https://github.com/intridea/hashie/blob/v3.5.3/lib/hashie.rb#L60
require "kaminari/sinatra"

##
# ## Enable devel logging
#
# Padrino::Logger::Config[:development][:log_level]  = :devel
# Padrino::Logger::Config[:development][:log_static] = true
#
# ## Configure your I18n
#
# I18n.default_locale = :en
# I18n.enforce_available_locales = false
#
# ## Configure your HTML5 data helpers
#
# Padrino::Helpers::TagHelpers::DATA_ATTRIBUTES.push(:dialog)
# text_field :foo, :dialog => true
# Generates: <input type="text" data-dialog="true" name="foo" />
#
# ## Add helpers to mailer
#
# Mail::Message.class_eval do
#   include Padrino::Helpers::NumberHelpers
#   include Padrino::Helpers::TranslationHelpers
# end

Padrino::Logger::Config[:production][:stream] = :stdout
Padrino::Logger::Config[:production][:log_level] = :info
Padrino::Logger::Config[:test][:stream] = :stdout
Padrino::Logger::Config[:test][:log_level] = :info

##
# Add your before (RE)load hooks here
#
Padrino.before_load do
  Time.zone = "UTC"
  Dotenv.load if defined?(Dotenv) && Padrino.env != :production
end

##
# Add your after (RE)load hooks here
#
# Padrino.after_load do
# end

Padrino.load!
