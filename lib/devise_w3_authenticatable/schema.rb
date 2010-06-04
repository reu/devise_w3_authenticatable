Devise::Schema.class_eval do
    # Creates login
    #
    # == Options
    # * :null - When true, allow columns to be null.
    def w3_authenticatable(options={})
      null = options[:null] || false

      apply_schema :logon, String, :null => null
    end

end
