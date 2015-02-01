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

  paginates_per 50

  after_save     :clear_cache
  before_destroy :clear_cache

  include Concerns::Plugin::Groonga

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
      update_plugins(fetched_plugins, newest_plugin.released_at)
    else
      bulk_insert_plugins(fetched_plugins)
    end
  end

  def self.update_plugins(plugins, newest_released_at)
    updated_plugins = plugins.select { |plugin| plugin.released_at > newest_released_at }

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
  end
  private_class_method :update_plugins

  def self.bulk_insert_plugins(plugins)
    Plugin.transaction do
      Plugin.import(plugins)
    end
    plugins
  end
  private_class_method :bulk_insert_plugins

  # @return [Array<Plugin>]
  def self.fetched_plugins
    fetch_update_center_plugins.each_with_object([]) do |(_k, v), array|
      array << build_from_update_center(v)
    end
  end
  private_class_method :fetched_plugins

  private

  def clear_cache
    %W(
      /plugins/#{name}
      /plugins/#{name}.svg
    ).each do |key|
      Sebastian::App.cache.delete(key)
    end
  end
end
