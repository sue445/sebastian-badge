module Concerns
  module Plugin
    module Groonga
      extend ActiveSupport::Concern

      included do
        after_save do |post|
          indexer = PluginIndexer.new
          indexer.add(post)
        end

        after_destroy do |post|
          indexer = PluginIndexer.new
          indexer.remove(post)
        end
      end
    end
  end
end
