class AddIndexToPluginsReleasedAt < ActiveRecord::Migration
  def self.up
    add_index :plugins, :released_at
  end

  def self.down
    remove_index :plugins
  end
end
