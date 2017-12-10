require 'json'
require 'uri'
require 'open-uri'
require 'openssl'
require 'fileutils'
require 'rainbow'
require 'net/http'

module OpenSSL
  module SSL
    remove_const :VERIFY_PEER
  end
end

OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)

module Jekyll

  class AmiDictPage < Page
    def initialize(site, base, dir, dictionaries, aggregatedDict)
      @site = site
      @base = base
      @dir = dir
      @name = 'types.html'

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'ami-dicts.html')
      self.data['dictionaries'] = dictionaries
      self.data['aggregatedDict'] = aggregatedDict
      self.data['title'] = 'AMIs, Qualifiers, AMISets dictionaries'
    end
  end

  class AmiDictPageGenerator < Generator
    safe true

    def getUrlContent(url)
      begin
        uri = URI(url)

        req = Net::HTTP::Get.new(uri)
        req['api-key'] = '2C949434-20FF-4636-BA96-B7C0CAD42612'

        res = Net::HTTP.start(uri.hostname, uri.port, :read_timeout => 240) {|http|
          http.request(req)
        }

        return JSON.parse(res.body)

      rescue Errno::ECONNREFUSED
        puts Rainbow("ERROR: Please start Tork server so the following URL is available : #{swaggerBasePath}").color(:red)
        exit
      end
    end

    def generate(site)
      dir = 'guide/medical-data'
      amiDictsUrl = 'http://localhost:8080/webapp/v1/dictionaries/ami'
      aggregatedAmiDictUrl = amiDictsUrl + '/aggregated'

      dictionaries = getUrlContent(amiDictsUrl + '?family=A7')
      aggregatedDict = getUrlContent(aggregatedAmiDictUrl + '?family=A7')

      site.pages << AmiDictPage.new(site, site.source, dir, dictionaries, aggregatedDict)
    end
  end
end