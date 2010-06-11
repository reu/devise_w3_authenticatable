require 'net/ldap'
require 'open-uri'
require 'hpricot'

module Devise
  module W3Adapter
    def self.valid_credentials?(logon, password)
      return unless dn = get_dn_from_bluepages(logon)

      user = Net::LDAP.new :host => "bluepages.ibm.com"
      user.authenticate(dn, password)
      user.bind
    end

    protected

    def self.get_dn_from_bluepages(logon)
      begin
        bluepages_url = "http://bluepages.ibm.com/BpHttpApisv3/slaphapi?ibmperson/mail=#{logon}.list/byxml?cn"
        ibmer = Hpricot.XML open(bluepages_url)
        (ibmer/:"entry").first.attributes["dn"]
      rescue
        nil
      end
    end
  end
end
