module Sebastian
  class App < Padrino::Application
    register SassInitializer
    use ConnectionPoolManagement
    register Padrino::Mailer
    register Padrino::Helpers
    register Kaminari::Helpers::SinatraHelpers

    enable :sessions

    ##
    # Caching support.
    #
    # register Padrino::Cache
    # enable :caching
    #
    # You can customize caching store engines:
    #
    # set :cache, Padrino::Cache.new(:LRUHash) # Keeps cached values in memory
    # set :cache, Padrino::Cache.new(:Memcached) # Uses default server at localhost
    # set :cache, Padrino::Cache.new(:Memcached, '127.0.0.1:11211', :exception_retry_limit => 1)
    # set :cache, Padrino::Cache.new(:Memcached, :backend => memcached_or_dalli_instance)
    # set :cache, Padrino::Cache.new(:Redis) # Uses default server at localhost
    # set :cache, Padrino::Cache.new(:Redis, :host => '127.0.0.1', :port => 6379, :db => 0)
    # set :cache, Padrino::Cache.new(:Redis, :backend => redis_instance)
    # set :cache, Padrino::Cache.new(:Mongo) # Uses default server at localhost
    # set :cache, Padrino::Cache.new(:Mongo, :backend => mongo_client_instance)
    # set :cache, Padrino::Cache.new(:File, :dir => Padrino.root('tmp', app_name.to_s, 'cache')) # default choice
    #

    # ref. https://devcenter.heroku.com/articles/memcachier
    cache = Dalli::Client.new(
      (ENV["MEMCACHIER_SERVERS"] || "127.0.0.1:11211").split(","),
      username:             ENV["MEMCACHIER_USERNAME"],
      password:             ENV["MEMCACHIER_PASSWORD"],
      failover:             true,
      socket_timeout:       1.5,
      socket_failure_delay: 0.2,
    )
    set :cache, Padrino::Cache.new(:Memcached, backend: cache)

    ##
    # Application configuration options.
    #
    # set :raise_errors, true       # Raise exceptions (will stop application) (default for test)
    # set :dump_errors, true        # Exception backtraces are written to STDERR (default for production/development)
    # set :show_exceptions, true    # Shows a stack trace in browser (default for development)
    # set :logging, true            # Logging in STDOUT for development and file for production (default only for development)
    # set :public_folder, 'foo/bar' # Location for static assets (default root/public)
    # set :reload, false            # Reload application files (default in development)
    # set :default_builder, 'foo'   # Set a custom form builder (default 'StandardFormBuilder')
    # set :locale_path, 'bar'       # Set path for I18n translations (default your_apps_root_path/locale)
    # disable :sessions             # Disabled sessions by default (enable if needed)
    # disable :flash                # Disables sinatra-flash (enabled by default if Sinatra::Flash is defined)
    # layout  :my_layout            # Layout can be in views/layouts/foo.ext or views/foo.ext (default :application)
    #

    ##
    # You can configure for a specified environment like:
    #
    #   configure :development do
    #     set :foo, :bar
    #     disable :asset_stamp # no asset timestamping for dev
    #   end
    #
    configure :development do
      set :enabled_paging_cache, false
    end
    configure :test do
      set :enabled_paging_cache, false
    end
    configure :production do
      set :enabled_paging_cache, false
    end

    ##
    # You can manage errors like:
    #
    #   error 404 do
    #     render 'errors/404'
    #   end
    #
    #   error 500 do
    #     render 'errors/500'
    #   end
    #

    error ActiveRecord::RecordNotFound do
      halt 404, "Not Found"
    end

    require "rollbar/middleware/sinatra"
    Rollbar.configure do |config|
      config.access_token = ENV["ROLLBAR_ACCESS_TOKEN"]
      config.environment  = Padrino.env
      config.enabled      = ENV["ROLLBAR_ACCESS_TOKEN"].present? && Padrino.env == :production

      config.exception_level_filters.merge!(
        "Sinatra::NotFound" => "ignore",
        "ActiveRecord::RecordNotFound" => "ignore",
      )
    end

    use Rollbar::Middleware::Sinatra

    ActiveRecord::SimpleIndexName.configure do |config|
      config.auto_shorten = true
    end
  end
end
