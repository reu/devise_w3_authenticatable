Devise::Schema.class_eval do
  def w3_authenticatable(options={})
    null = options[:null] || false
    default = options[:default] || ""

    apply_schema :logon, String, :null => null, :default => default
  end
end
