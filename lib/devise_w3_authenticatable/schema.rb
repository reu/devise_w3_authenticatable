module Devise
  module Schema
    def w3_authenticatable(options = {})
      null = options[:null] || false

      apply_devise_schema :email, String, :null => null
    end
  end
end
