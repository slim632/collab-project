require 'net/http'

module Youtube
  class Client
    class APIError < StandardError; end

    BASE_URL = 'https://mock-youtube-api-f3d0c17f0e38.herokuapp.com/api'

    def initialize(base_url: BASE_URL)
      @base_url = base_url
    end

    def videos(page: 1)
      response = fetch(URI(@base_url + "/videos?page=#{page}"))
      raise APIError, 'API request failed' unless success?(response)
      JSON.parse(response.body)
    end

    private

    def fetch(uri)
      request =  Net::HTTP::Get.new(uri)
      http_client.request(request)
    end

    def http_client
      @http_client ||= begin
        base_uri = URI(@base_url)

        Net::HTTP.new(base_uri.host, base_uri.port).tap do |client|
          client.use_ssl = true
          client.verify_mode = OpenSSL::SSL::VERIFY_PEER
        end
      end
    end

    def success?(response)
      response.code == "200"
    end
  end
end
