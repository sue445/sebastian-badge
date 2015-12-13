class CreatePlugins < ActiveRecord::Migration
  include ActiveRecord::SimpleIndexName::DisableShorten

  def self.up
    create_table :plugins do |t|
      t.string :name
      t.string :title
      t.string :version
      t.string :wiki_url
      t.timestamp :released_at, null: false
      t.timestamps null: false
    end

    add_index :plugins, :name, unique: true
  end

  def self.down
    drop_table :plugins
  end
end
