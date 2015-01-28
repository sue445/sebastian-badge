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
end
