require 'devise/strategies/authenticatable'

module Devise
  module Strategies
    class W3Authenticatable < Authenticatable
      def valid?
        super && mapping.to.respond_to?(:authenticate_with_w3)
      end

      def authenticate!
        if resource = mapping.to.authenticate_with_w3(params[scope])
          success!(resource)
        else
          fail(:invalid)
        end
      end
    end
  end
end

Warden::Strategies.add(:w3_authenticatable, Devise::Strategies::W3Authenticatable)
