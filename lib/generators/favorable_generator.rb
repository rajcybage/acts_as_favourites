require 'rails/generators'
require 'rails/generators/migration'

module Favorable
  class FavorableGenerator < Rails::Generators::Base
    include Rails::Generators::Migration
    def self.source_root
      File.join(File.dirname(__FILE__), "templates")
    end
    
    def self.next_migration_number(path)
      Time.now.utc.strftime("%Y%m%d%H%M%S")
    end 

    def create_migration_file
      migration_template "migrator.rb", "db/migrate/favorable_migration.rb"
    end

    def create_model
      template "model.rb", File.join("app/models", "favorite.rb")
    end

  end
end