module PlayFutsal
  class Engine < ::Rails::Engine
    isolate_namespace PlayFutsal

    config.autoload_paths += Dir["#{config.root}/lib","#{config.root}/lib/**/"]
  end
end
