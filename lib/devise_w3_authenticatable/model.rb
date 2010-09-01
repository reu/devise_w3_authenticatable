require 'devise_w3_authenticatable/strategy'

module Devise
  module Models
    module W3Authenticatable
      extend ActiveSupport::Concern

      included do
        attr_accessor :password
      end

      def authenticate_with_w3!(password)
        Devise::W3Adapter.valid_credentials? email, password
      end

      def after_w3_authentication(employee = nil)
      end

      module ClassMethods
        def find_for_w3_authentication(conditions={})
          if DeviseW3Authenticatable.auto_create_user
            find_or_initialize_by_email(conditions[:email])
          else
            find_by_email(conditions[:email])
          end
        end
      end
    end
  end
end
