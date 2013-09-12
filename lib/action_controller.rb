module ActionController
  class Base
    attr_accessor :request, :response

    def process(action)
      send action
    end
  end
end