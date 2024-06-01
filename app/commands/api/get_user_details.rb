module Api
  class GetUserDetails
    include Mixins::Util

    def self.call(...)
      new(...).call
    end

    def initialize(token)
      @token = token
    end

    def call
      response = get_request(url, headers:)

      {
        name: response["display_name"],
        photo: response["images"].last["url"],
        country: response["country"],
        email: response["email"]
      }
    end

    private

    def url = "https://api.spotify.com/v1/me"

    def headers
      { "Authorization" => "Bearer #{@token}" }
    end
  end
end
