require_relative "boot"

require "rails/all"
require 'devise'

Bundler.require(*Rails.groups)

module Furima40110
  class Application < Rails::Application
    #config.load_defaults 7.0
  end
end

Rails.application.routes.draw do
  devise_for :users

  # Other routes definitions
end


