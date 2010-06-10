# encoding: utf-8
require 'devise'

require 'devise_w3_authenticatable/schema'
require 'devise_w3_authenticatable/w3_adapter'
require 'devise_w3_authenticatable/routes'

module Devise
  # Attribute for login
  mattr_accessor :w3_create_user
  @@w3_create_user = true
end

# Add w3_authenticatable strategy to defaults.
Devise.add_module(:w3_authenticatable,
                  :strategy   => true,
                  :controller => :sessions,
                  :route => :w3_authenticatable,
                  :model  => 'devise_w3_authenticatable/model')
