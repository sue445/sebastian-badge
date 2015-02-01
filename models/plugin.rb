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

class Plugin < ActiveRecord::Base
  paginates_per 50

  after_save     :clear_cache
  before_destroy :clear_cache

  include Concerns::PluginModules::Groonga
  include Concerns::PluginModules::UpdateCenter

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
