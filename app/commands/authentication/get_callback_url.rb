module Authentication
  class GetCallbackUrl
    include Rails.application.routes.url_helpers

    def self.call
      new.call
    end

    def initialize
      @host = if Rails.env.development?
                'http://localhost:3000'
              else
                "https://infinite-headland-70464-c4a64d185cf5.herokuapp.com"
              end
      @port = Rails.env.development? ? 3000 : nil
    end

    def call
      callback_url(host: @host, port: @port)
    end
  end
end
