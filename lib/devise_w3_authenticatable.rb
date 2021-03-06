# encoding: utf-8
require 'devise'

require 'devise_w3_authenticatable/schema'
require 'devise_w3_authenticatable/w3_adapter'

require 'active_support'

# Add w3_authenticatable strategy to defaults.
Devise.add_module(:w3_authenticatable,
                  :strategy   => true,
                  :controller => :sessions,
                  :route => :session,
                  :model  => 'devise_w3_authenticatable/model')

module DeviseW3Authenticatable
  # Should we create the user on the local database?
  mattr_accessor :auto_create_user
  @@auto_create_user = true
end
