module <%= options["scope"].titleize %>
  class <%= class_name %>
    def self.call(...)
      new(...).call
    end

    def initialize(args)
    end

    def call
    end
  end
end
