module Concerns
  module PluginModules
    module UpdateCenter
      extend ActiveSupport::Concern

      module ClassMethods
        require "open-uri"

        UPDATE_CENTER_URL = "https://updates.jenkins-ci.org/current/update-center.json".freeze

        # get plugins in update-center.json
        # @return [Hash]
        def fetch_update_center_plugins
          jsonp = open(UPDATE_CENTER_URL, ssl_verify_mode: OpenSSL::SSL::VERIFY_NONE).read
          json = jsonp.gsub(/updateCenter.post\((.+)\);/m) { Regexp.last_match[1] }
          JSON.parse(json)["plugins"]
        end

        # @param args [Hash] value of plugins
        # @return [Plugin]
        def build_from_update_center(args)
          Plugin.new(
            name:        args["name"],
            title:       args["title"],
            version:     args["version"],
            wiki_url:    args["wiki"],
            released_at: Time.zone.parse(args["releaseTimestamp"])
          )
        end

        # download update-center.json and bulk import to DB
        def import_from_update_center
          newest_plugin = Plugin.order(released_at: :desc).take

          if newest_plugin
            update_plugins(fetched_plugins, newest_plugin.released_at)
          else
            bulk_insert_plugins(fetched_plugins)
          end
        end

        private

          def update_plugins(plugins, newest_released_at)
            updated_plugins = plugins.select { |plugin| plugin.released_at > newest_released_at }

            Plugin.transaction do
              updated_plugins.each do |updated_plugin|
                plugin = Plugin.find_or_initialize_by(name: updated_plugin.name)
                plugin.update_attributes!(
                  title:       updated_plugin.title,
                  version:     updated_plugin.version,
                  wiki_url:    updated_plugin.wiki_url,
                  released_at: updated_plugin.released_at
                )
              end
            end

            updated_plugins
          end

          def bulk_insert_plugins(plugins)
            Plugin.transaction do
              plugins.each do |plugin|
                plugin.save!
              end
            end
            plugins
          end

          # @return [Array<Plugin>]
          def fetched_plugins
            fetch_update_center_plugins.each_with_object([]) do |(_k, v), array|
              array << build_from_update_center(v)
            end
          end
      end
    end
  end
end
