module PlayFutsal
  class Engine < ::Rails::Engine
    isolate_namespace PlayFutsal

    config.autoload_paths += Dir["#{config.root}/lib","#{config.root}/lib/**/"]
    config.autoload_paths += %W(
      #{config.root}/app/controllers/concerns
      #{config.root}/app/models/concerns
    )

    config.i18n.load_path += Dir[PlayFutsal::Engine.root.join('config', 'locales', '**', '*.{rb,yml}')]


    def self.app_path
      File.expand_path '../../app', called_from
    end

    %w{controller helper model}.each do |resource|
      class_eval <<-RUBY
        def self.#{resource}_path(name)
          File.expand_path "#{resource.pluralize}/play_futsal/\#{name}.rb", app_path
        end
      RUBY
    end

  end
end
