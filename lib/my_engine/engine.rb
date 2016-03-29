module MyEngine
  class Engine < ::Rails::Engine

    initializer("my_engine.react-rails") do |app|
      MyEngine::Engine.config.react.variant = :production
    end

    require 'react-rails'
  end
end