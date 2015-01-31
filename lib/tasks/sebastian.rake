namespace :sebastian do
  desc "download update-center.json and import to DB"
  task :import => :environment do
    plugins = Plugin.import_from_update_center
    Padrino.logger.info "Total #{Plugin.count} plugins, Updated #{plugins.count} plugins"
  end

  desc "clear all cache"
  task :clear_all_cache => :environment do
    Sebastian::App.cache.clear
    Padrino.logger.info "Cleared All cache"
  end
end
