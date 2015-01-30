# == Schema Information
#
# Table name: plugins
#
#  id          :integer          not null, primary key
#  name        :string
#  title       :string
#  version     :string
#  wiki_url    :string
#  released_at :datetime         not null
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#
# Indexes
#
#  index_plugins_on_name         (name) UNIQUE
#  index_plugins_on_released_at  (released_at)
#

require "open-uri"

class Plugin < ActiveRecord::Base
  UPDATE_CENTER_URL = "https://updates.jenkins-ci.org/current/update-center.json"

  # get plugins in update-center.json
  # @return [Hash]
  def self.fetch_update_center_plugins
    jsonp = open(UPDATE_CENTER_URL).read
    json = jsonp.gsub(/updateCenter.post\((.+)\);/m) { Regexp.last_match[1] }
    JSON.parse(json)["plugins"]
  end

  # @param args [Hash] value of plugins
  # @return [Plugin]
  def self.build_from_update_center(args)
    Plugin.new(
      name:        args["name"],
      title:       args["title"],
      version:     args["version"],
      wiki_url:    args["wiki"],
      released_at: Time.zone.parse(args["releaseTimestamp"]),
    )
  end

  # download update-center.json and bulk import to DB
  def self.import_from_update_center
    newest_plugin = Plugin.order(released_at: :desc).take

    if newest_plugin
      newest_released_at = newest_plugin.released_at
      updated_plugins = fetched_plugins.select { |plugin| plugin.released_at > newest_released_at }

      Plugin.transaction do
        updated_plugins.each do |updated_plugin|
          plugin = Plugin.find_or_initialize_by(name: updated_plugin.name)
          plugin.update_attributes!(
            title:       updated_plugin.title,
            version:     updated_plugin.version,
            wiki_url:    updated_plugin.wiki_url,
            released_at: updated_plugin.released_at,
          )
        end
      end

      updated_plugins
    else
      # no plugins
      Plugin.transaction do
        Plugin.import(fetched_plugins)
      end
      fetched_plugins
    end
  end

  def self.fetched_plugins
    fetch_update_center_plugins.each_with_object([]) do |(_k, v), array|
      array << build_from_update_center(v)
    end
  end
  private_class_method :fetched_plugins
end
