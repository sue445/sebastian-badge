# Helper methods defined here can be accessed in any controller or view in the application

module Sebastian
  class App
    module PluginsHelper
      # def simple_helper_method
      # ...
      # end

      def badge_url(plugin)
        absolute_url(:plugins, :show, name: plugin.name, format: :svg)
      end
    end

    helpers PluginsHelper
  end
end
