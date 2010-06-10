require 'net/ldap'
require 'open-uri'
require 'hpricot'

module Devise
  module W3Adapter
    def self.valid_credentials?(login, password)
      return unless dn = get_dn_from_bluepages(login)

      user = Net::LDAP.new :host => "bluepages.ibm.com"
      user.authenticate(dn, password)
      user.bind
    end

    protected

    def self.get_dn_from_bluepages(login)
      begin
        bluepages_url = "http://bluepages.ibm.com/BpHttpApisv3/slaphapi?ibmperson/mail=#{login}.list/byxml?cn"
        ibmer = Hpricot.XML open(bluepages_url)
        (ibmer/:"entry").first.attributes["dn"]
      rescue
        nil
      end
    end
  end
end
