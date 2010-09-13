require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class W3Authenticatable < Authenticatable
      def authenticate!
        resource = mapping.to.find_for_w3_authentication(authentication_hash)

        employee = nil

        if validate(resource) { employee = resource.authenticate_with_w3!(password) }
          resource.after_w3_authentication employee
          resource.save if DeviseW3Authenticatable.auto_create_user
          success! resource
        else
          fail :invalid
        end
      end
    end
  end
end

Warden::Strategies.add(:w3_authenticatable, Devise::Strategies::W3Authenticatable)
