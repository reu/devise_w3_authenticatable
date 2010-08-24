require 'net/ldap'
require 'open-uri'
require 'nokogiri'

module Devise
  module W3Adapter
    def self.valid_credentials?(logon, password)
      return unless employee = get_information_from_bluepages(logon)

      user = Net::LDAP.new :host => "bluepages.ibm.com"
      user.authenticate(employee.uid, password)

      user.bind and employee
    end

    def self.get_information_from_bluepages(logon)
      IBMEmployee.parse_from_bluepages("http://bluepages.ibm.com/BpHttpApisv3/slaphapi?ibmperson/mail=#{logon}.list/byxml")
    end

    class IBMEmployee < Struct.new(:uid, :logon, :name, :serial, :department, :country, :workplace)
      def self.parse_from_bluepages(bluepages_url)
        begin
          entry = Nokogiri::XML(open(bluepages_url)).css("entry").first

          uid        = entry.attributes["dn"].to_s
          logon      = entry.css("attr[name='mail'] value").children.first.to_s
          name       = entry.css("attr[name='cn'] value").children.first.to_s
          serial     = entry.css("attr[name='serialnumber'] value").children.first.to_s
          department = entry.css("attr[name='dept'] value").children.first.to_s
          country    = entry.css("attr[name='co'] value").children.first.to_s
          workplace  = entry.css("attr[name='physicaldeliveryofficename'] value").children.first.to_s

          new(uid, logon, name, serial, department, country, workplace)
        rescue
          nil
        end
      end
    end
  end
end
