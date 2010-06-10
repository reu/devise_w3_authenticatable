require 'devise_w3_authenticatable/strategy'

module Devise
  module Models
    module W3Authenticatable
      def self.included(base)
        base.class_eval do
          extend ClassMethods
          attr_accessor :password
        end
      end

      module ClassMethods
        # Authenticate a user based on configured attribute keys. Returns the
        # authenticated user if it's valid or nil.
        def authenticate_with_w3(attributes={})
          return unless attributes[:login].present? || attributes[:password].present?

          if Devise::W3Adapter.valid_credentials? attributes[:login], attributes[:password]
            resource = find_for_w3_authentication(attributes)

            # Saves the resource to the database if we said so
            resource.save if Devise.w3_create_user
          end
        end

      protected

        # Find first record based on conditions given (ie by the sign in form).
        # Overwrite to add customized conditions, create a join, or maybe use a
        # namedscope to filter records while authenticating.
        def find_for_w3_authentication(conditions={})
          find_or_initialize_by_logon(conditions[:login])
        end
      end
    end
  end
end
