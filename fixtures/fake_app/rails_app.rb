require 'rails/application'
require "action_controller/railtie"

FakeApp = Class.new(Rails::Application)
FakeApp.config.eager_load = false
FakeApp.config.hosts << 'www.example.com' if FakeApp.config.respond_to?(:hosts)
FakeApp.config.root = File.dirname(__FILE__)
FakeApp.initialize!

FakeApp.routes.draw do
  resources :users do
    get 'friends', to: :friends
  end
end
