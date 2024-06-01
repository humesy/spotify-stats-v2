module Api
  class GetAuthToken
    include Rails.application.routes.url_helpers

    def self.call(...)
      new(...).call
    end

    def initialize(host, port, verifier, code)
      @client_id = AppConstants::CLIENT_ID
      @host = host
      @port = port
      @verifier = verifier
      @code = code
    end

    def call
      data = {
        client_id: @client_id,
        grant_type: "authorization_code",
        redirect_uri: callback_url(host: @host, port: @port),
        code_verifier: @verifier,
        code: @code
      }.map { |k, v| "#{k}=#{v}" }.join("&")

      uri = URI('https://accounts.spotify.com/api/token')
      http = Net::HTTP.new(uri.host, uri.port)
      http.use_ssl = true
      request = Net::HTTP::Post.new(uri.path, {'Content-Type' => 'application/x-www-form-urlencoded'})
      request.body = data
      response = http.request(request)

      JSON.parse(response.body)["access_token"]
    end
  end
end
