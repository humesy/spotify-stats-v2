module Authentication
  class CreateChallenge
    def self.call(...)
      new(...).call
    end

    def initialize(verifier)
      @verifier = verifier
    end

    def call
      Base64.encode64(
        Digest::SHA256.digest(
          @verifier
        )
      ).gsub(/=/, '').gsub(/\+/, '-').gsub(/\//, '_').chomp
    end
  end
end
