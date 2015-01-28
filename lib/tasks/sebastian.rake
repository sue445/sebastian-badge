namespace :sebastian do
  desc "download update-center.json and import to DB"
  task :import => :environment do
    Plugin.import_from_update_center
    Padrino.logger.info "Total #{Plugin.count} plugins"
  end
end
