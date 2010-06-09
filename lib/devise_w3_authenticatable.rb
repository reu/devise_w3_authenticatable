# encoding: utf-8
require 'devise'

require 'devise_w3_authenticatable/schema'
require 'devise_w3_authenticatable/w3_adapter'
require 'devise_w3_authenticatable/routes'

module Devise
  # Attribute for login
  mattr_accessor :w3_login_attribute
  @@w3_login_attribute = nil
end

# Add w3_authenticatable strategy to defaults.
Devise.add_module(:w3_authenticatable,
                  :strategy   => true,
                  :controller => :sessions,
                  :model  => 'devise_w3_authenticatable/model')
