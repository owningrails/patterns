require "not_active_record"
require "filters"
require "rendering"

module Controller
  class Metal
    attr_accessor :request, :response

    def process(action)
      send action
    end

    def params
      request.params
    end
  end

  class Base < Metal
    include Filters
    include Rendering
  end
end