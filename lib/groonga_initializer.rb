module GroongaInitializer
  require "fileutils"
  require "groonga"

  def self.registered(app)
    if ENV["GROONGA_DATABASE_PATH"]
      Groonga::Database.open(ENV["GROONGA_DATABASE_PATH"])

    else
      database_path = Padrino.root("db/groonga/#{Padrino.env}/db.groonga")
      if File.exist?(database_path)
        Groonga::Database.open(database_path)
      else
        FileUtils.mkdir_p(File.dirname(database_path))
        Groonga::Database.create(path: database_path)
      end
    end
  end
end
