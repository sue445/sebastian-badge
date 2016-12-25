class AddIndexToPluginsReleasedAt < ActiveRecord::Migration[4.2]
  include ActiveRecord::SimpleIndexName::DisableShorten

  def self.up
    add_index :plugins, :released_at
  end

  def self.down
    remove_index :plugins
  end
end
