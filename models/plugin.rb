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
#  index_plugins_on_name  (name) UNIQUE
#

require "open-uri"

class Plugin < ActiveRecord::Base
  UPDATE_CENTER_URL = "https://updates.jenkins-ci.org/current/update-center.json"

  # get plugins in update-center.json
  # @return [Hash]
  def self.get_update_center_plugins
    jsonp = open(UPDATE_CENTER_URL).read
    json = jsonp.gsub(/updateCenter.post\((.+)\);/m){ $1 }
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

  # download update-center.json and bulk insert to DB
  def self.import_from_update_center
    plugins = get_update_center_plugins.each_with_object([]) do |(_k, v), array|
      array << build_from_update_center(v)
    end

    Plugin.transaction do
      Plugin.delete_all
      Plugin.import(plugins)
    end
  end
end
