namespace :groonga do
  require "groonga"
  require "fileutils"

  desc "Setup groonga"
  task :setup => :environment do
    Padrino.logger.info "Setup Groonga"

    Groonga::Schema.define do |schema|
      schema.create_table("Plugins",
                          type: :hash,
                          key_type: :uint32) do |table|
        table.short_text("name")
        table.short_text("title")
        table.short_text("version")
        table.short_text("wiki_url")
        # table.text("")
        table.time("released_at")
        table.time("created_at")
        table.time("updated_at")
      end
    end

    if Plugin.table_exists?
      indexer = PluginIndexer.new
      Plugin.all.each do |post|
        indexer.add(post)
      end
    end

    Groonga::Schema.define do |schema|
      schema.create_table("Terms",
                          type: :patricia_trie,
                          key_type: :short_text,
                          normalizer: "NormalizerAuto",
                          default_tokenizer: "TokenBigram") do |table|
        table.index("Plugins.name")
        table.index("Plugins.title")
        table.index("Plugins.wiki_url")
      end

      schema.create_table("Times",
                          type: :patricia_trie,
                          key_type: :time) do |table|
        table.index("Plugins.released_at")
      end
    end
  end
end
