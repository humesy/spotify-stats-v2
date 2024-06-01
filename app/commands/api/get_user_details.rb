module Api
  class GetUserDetails
    def self.call(...)
      new(...).call
    end

    def initialize(token)
      @token = token
    end

    def call
      uri = URI('https://api.spotify.com/v1/me')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Get.new(uri.path, {'Authorization' => "Bearer #{@token}"})
      response = http.request(request)

      details = JSON.parse(response.body)
      {
        name: details["display_name"],
        photo: details["images"].last["url"],
        country: details["country"],
        email: details["email"]
      }
    end
  end
end
