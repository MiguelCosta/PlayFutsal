module PlayFutsal
  module Generators
    class InstallGenerator < Rails::Generators::Base

      source_root File.expand_path('../templates', __FILE__)

      # define generator argument (only for Base instead of NamedBase)
      argument :user,       :type => :string, :default => 'PlayAuth::User'
      argument :federation, :type => :string, :default => 'Federation'
  
      desc "Generates configuration based on NAME"

      #def create_admin
      #  admin_role = Blogcms::Role.find_or_create_by_name(name: 'Administrator')
      #  u = name.classify.constantize.find_by_name(user_name)
      #  Blogcms::RoleUser.create(:user => u, :role => admin_role)
      #end

      def template_initializers
        template "initializer.rb", "config/initializers/play_futsal.rb"
      end

      def inject_seeds
        append_file "db/seeds.rb", "PlayFutsal::Engine.load_seed\n"
      end

      def inject_routes
        inject_into_file  "config/routes.rb",
                          "\n  mount PlayFutsal::Engine => \"/futsal\", :as => \"futsal\"",
                          :after => "Rails.application.routes.draw do\n"
      end
      
    end
  end
end