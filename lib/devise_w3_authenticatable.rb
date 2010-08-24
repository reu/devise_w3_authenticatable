# encoding: utf-8
require 'devise'

require 'devise_w3_authenticatable/schema'
require 'devise_w3_authenticatable/w3_adapter'

# Add w3_authenticatable strategy to defaults.
Devise.add_module(:w3_authenticatable,
                  :strategy   => true,
                  :controller => :sessions,
                  :route => :session,
                  :model  => 'devise_w3_authenticatable/model')

module DeviseW3Authenticatable
end
