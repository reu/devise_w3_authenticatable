Devise::Schema.class_eval do
  def w3_authenticatable(options={})
    null = options[:null] || false

    apply_schema :logon, String, :null => null
  end
end
