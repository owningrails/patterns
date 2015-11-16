module ActionController
  class Base
    attr_accessor :request, :response

    def process(action)
      # action == "index"
      # `send "index"` same as `index`
      send action # calls index
    end

    def render(options)
      response.write options[:text]
    end

    def params
      request.params
    end
  end
end