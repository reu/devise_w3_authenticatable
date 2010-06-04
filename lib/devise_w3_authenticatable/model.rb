require 'devise_ldap_authenticatable/strategy'

module Devise
  module Models
    # LDAP Module, responsible for validating the user credentials via LDAP.
    #
    # Examples:
    #
    #    User.authenticate('email@test.com', 'password123')  # returns authenticated user or nil
    #    User.find(1).valid_password?('password123')         # returns true/false
    #
    module LdapAuthenticatable
      def self.included(base)
        base.class_eval do
          extend ClassMethods

          attr_accessor :password
        end
      end

      # Set password to nil
      def clean_up_passwords
        self.password = nil
      end

      # Checks if a resource is valid upon authentication.
      def valid_w3_authentication?(password)
        Devise::W3Adapter.valid_credentials?(self.login, password)
      end

      module ClassMethods
        # Authenticate a user based on configured attribute keys. Returns the
        # authenticated user if it's valid or nil.
        def authenticate_with_w3(attributes={})
          return unless attributes[:login].present?
          conditions = attributes.slice(:login)

          unless conditions[:login]
            conditions[:login] = "#{conditions[:login]}"
          end

          find_for_w3_authentication(conditions)
        end

      protected

        # Find first record based on conditions given (ie by the sign in form).
        # Overwrite to add customized conditions, create a join, or maybe use a
        # namedscope to filter records while authenticating.
        # Example:
        #
        #   def self.find_for_imap_authentication(conditions={})
        #     conditions[:active] = true
        #     find(:first, :conditions => conditions)
        #   end
        #
        def find_for_w3_authentication(conditions)
          find(:first, :conditions => conditions)
        end
      end
    end
  end
end
