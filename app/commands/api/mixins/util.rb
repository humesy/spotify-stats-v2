module Api
  module Mixins
    module Util
      def get_request(url, params: nil, headers: {})
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Get.new(uri.path, headers)
        request.body = map_params(params) if params.present?
        response = http.request(request)

        JSON.parse(response.body)
      end

      def post_request(url, params: nil, headers: {})
        uri = URI(url)
        http = Net::HTTP.new(uri.host, uri.port)
        http.use_ssl = true
        request = Net::HTTP::Post.new(uri.path, headers)
        request.body = map_params(params) if params.present?
        response = http.request(request)

        JSON.parse(response.body)
      end

      private

      def map_params(params)
        params.map { |k, v| "#{k}=#{v}" }.join("&")
      end
    end
  end
end