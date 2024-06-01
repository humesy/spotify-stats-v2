module Authentication
  class CreateVerifier
    def self.call
      new.call
    end

    def initialize
      @length = 128
      @chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789"
    end

    def call
      char_array = (1..@length).map do
        @chars[rand(0..@chars.length-1)]
      end

      char_array.join
    end
  end
end