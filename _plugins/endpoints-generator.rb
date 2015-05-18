require 'json'
require 'open-uri'
require 'uri'
require 'openssl'
require 'fileutils'

module OpenSSL
  module SSL
    remove_const :VERIFY_PEER
  end
end

OpenSSL::SSL.const_set(:VERIFY_PEER, OpenSSL::SSL::VERIFY_NONE)

module Jekyll

  class EndpointPage < Page
    def initialize(site, base, dir, endpoint)
      @site = site
      @base = base
      @dir = dir
      @name = endpoint['page']

      self.process(@name)
      self.read_yaml(File.join(base, '_layouts'), 'endpoint.html')
      self.data['endpoint'] = endpoint
      self.data['title'] = "#{endpoint['name']}"
    end
  end

  class EndpointPageGenerator < Generator
    safe true

    def generate(site)
      dir = 'endpoints'
      swaggerBasePath = site.data['swagger']['baseUrl']

      descriptions = Hash.new
      swagger = JSON open(swaggerBasePath) { |io| io.read }

      swagger['apis'].each do |api|
        descriptions[api['path']] = api['description']
      end

      site.data['swagger']['endpoints'].each do |api|
        endpoint = JSON open(swaggerBasePath + api['uri']) { |io| io.read }

        endpoint['name'] = api['name']
        endpoint['page'] = api['page'] + '.html'
        endpoint['description'] = descriptions[api['uri']]
        endpoint['fa-icon'] = api['fa-icon']
        endpoint['json'] = endpoint.to_json

        site.pages << EndpointPage.new(site, site.source, dir, endpoint)
      end
    end
  end
end