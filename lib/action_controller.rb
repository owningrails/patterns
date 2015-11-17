require "filters"
require "rendering"

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action)
      # action == "index"
      # `send "index"` same as `index`
      send action # calls index
    end

    def params
      request.params
    end
  end

  # class Child < Parent
  class Base < Metal
    include Filters
    include Rendering
  end
end