module Api
  class GetAuthToken
    include Mixins::Util

    def self.call(...)
      new(...).call
    end

    def initialize(verifier, code)
      @client_id = AppConstants::CLIENT_ID
      @verifier = verifier
      @code = code
    end

    def call
      response = post_request(url, params:, headers:)

      response["access_token"]
    end

    private

    def url = "https://accounts.spotify.com/api/token"

    def headers
      { "Content-Type" => "application/x-www-form-urlencoded" }
    end

    def params
      {
        client_id: @client_id,
        grant_type: "authorization_code",
        redirect_uri: Authentication::GetCallbackUrl.call,
        code_verifier: @verifier,
        code: @code
      }
    end
  end
end
