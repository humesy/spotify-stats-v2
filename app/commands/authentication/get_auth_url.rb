module Authentication
  class GetAuthUrl
    include Rails.application.routes.url_helpers

    def self.call(...)
      new(...).call
    end

    def initialize(host, port, verifier)
      @client_id = AppConstants::CLIENT_ID
      @host = host
      @port = port
      @verifier = verifier
    end

    def call
      params = {
        client_id: @client_id,
        response_type: "code",
        redirect_uri: callback_url(host: @host, port: @port),
        scope: "user-read-private user-read-email",
        code_challenge_method: "S256",
        code_challenge: Authentication::CreateChallenge.call(@verifier)
      }.map { |k, v| "#{k}=#{v}" }.join("&")

      "https://accounts.spotify.com/authorize?#{params}"
    end
  end
end
