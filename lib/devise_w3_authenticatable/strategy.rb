require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class W3Authenticatable < Authenticatable
      def authenticate!
        resource = mapping.to.find_for_w3_authentication(authentication_hash)

        if validate(resource) { resource.valid_w3_password?(password) }
          resource.after_w3_authentication
          success! resource
        else
          fail :invalid
        end
      end
    end
  end
end

Warden::Strategies.add(:w3_authenticatable, Devise::Strategies::W3Authenticatable)
