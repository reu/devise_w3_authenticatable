module Devise
  module W3Authenticatable
    module Schema
      def w3_authenticatable(options = {})
        null = options[:null] || false

        apply_devise_schema :email, String, :null => null
      end
    end
  end
end

Devise::Schema.module_eval do
  include ::Devise::W3Authenticatable::Schema
end
