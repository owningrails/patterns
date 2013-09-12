require "active_record"
require "filters"
require "rendering"

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action)
      send action
    end
  end

  class Base < Metal
    include Filters
    include Rendering
  end
end