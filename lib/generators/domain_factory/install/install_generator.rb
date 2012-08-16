module DomainFactory
  module Generators
    class InstallGenerator < Rails::Generators::Base
      desc "Installs needed configuration files."
           
      source_root File.expand_path('../templates', __FILE__)
      
      def copy_config_file
        copy_file "domain_factory.yml", "config/domain_factory.yml"
      end      
      
      def create_directories
        empty_directory "config/deploy"
      end
      
      def copy_deploy_files
        copy_file "deploy.rb", "config/deploy.rb"
        copy_file "staging.rb", "config/deploy/staging.rb"
        copy_file "production.rb", "config/deploy/production.rb"
      end  
      
      def copy_database_file
        copy_file "database.yml.example", "config/database.yml.example"
      end          
    end
  end
end
