require 'net/ldap'

module Devise
  module W3Adapter
    def self.valid_credentials?(login, password)
      user = Net::LDAP.new :host => "bluepages.ibm.com"
      user.authenticate login, password
      user.bind
    end
  end
end
