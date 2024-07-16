module Youtube
  class Provider
    class UnavailableError < StandardError; end

    def initialize(client: Youtube::Client.new)
      @client = client
    end

    def list(page: 1)
      @client.videos(page: page)
    rescue Youtube::Client::APIError => e
      Rails.logger.error "Youtube::Client returned error."
      Rails.logger.error e.message
      Rails.logger.error e.backtrace

      raise UnavailableError, 'An error occured while fetching data from Mock YouTube API'
    end
  end
end
