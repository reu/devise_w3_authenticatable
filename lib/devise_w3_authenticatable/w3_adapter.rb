require 'net/ldap'
require 'open-uri'
require 'nokogiri'

module Devise
  module W3Adapter
    def self.valid_credentials?(logon, password)
      return unless employee = IBMEmployee.find_by_mail(logon)

      user = Net::LDAP.new :host => "bluepages.ibm.com"
      user.authenticate(employee.uid, password)

      user.bind and employee
    end

    class IBMEmployee < Struct.new(:uid, :logon, :name, :serial, :department, :country, :workplace)
      class << self
        def parse_from_bluepages(bluepages_url)
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

        def find_by_mail(mail)
          parse_from_bluepages("http://bluepages.ibm.com/BpHttpApisv3/slaphapi?ibmperson/mail=#{mail}.list/byxml")
        end
      end
    end
  end
end
