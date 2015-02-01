module GroongaInitializer
  require "fileutils"
  require "groonga"

  def self.registered(app)
    database_path = ENV["GROONGA_DATABASE_PATH"] || Padrino.root("groonga/database/#{Padrino.env}/db.groonga")
    if File.exist?(database_path)
      Groonga::Database.open(database_path)
    else
      # FileUtils.mkdir_p(File.dirname(database_path))
      FileUtils.mkdir_p(File.dirname(database_path))
      Groonga::Database.create(path: database_path)
    end
  end
end
