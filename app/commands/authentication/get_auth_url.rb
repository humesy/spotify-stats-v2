module Authentication
  class GetAuthUrl
    def self.call(...)
      new(...).call
    end

    def initialize(verifier)
      @client_id = AppConstants::CLIENT_ID
      @verifier = verifier
    end

    def call
      params = {
        client_id: @client_id,
        response_type: "code",
        redirect_uri: Authentication::GetCallbackUrl.call,
        scope: "user-read-private user-read-email",
        code_challenge_method: "S256",
        code_challenge: Authentication::CreateChallenge.call(@verifier)
      }.map { |k, v| "#{k}=#{v}" }.join("&")

      "https://accounts.spotify.com/authorize?#{params}"
    end
  end
end
