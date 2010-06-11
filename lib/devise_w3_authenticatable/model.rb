require 'devise_w3_authenticatable/strategy'

module Devise
  module Models
    module W3Authenticatable
      extend ActiveSupport::Concern

      included do
        attr_accessor :password
      end

      def valid_w3_password?(password)
        Devise::W3Adapter.valid_credentials? logon, password
      end

      def after_w3_authentication
      end

      module ClassMethods
        protected

        # Find first record based on conditions given (ie by the sign in form).
        # Overwrite to add customized conditions, create a join, or maybe use a
        # namedscope to filter records while authenticating.
        def find_for_w3_authentication(conditions={})
          find_or_initialize_by_logon(conditions[:logon])
        end
      end
    end
  end
end
