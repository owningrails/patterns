module ActionController
  class Base
    attr_accessor :request, :response

    def process(action)
      # action == "index"
      # `send "index"` same as `index`
      send action # calls index
    end
  end
end