require "filtering"

module ActionController
  class Metal
    attr_accessor :request, :response

    def process(action_name)
      send action_name # index
    end
  end

  class Base < Metal
    include Filtering
  end
end