module ActionController
  class Base
    attr_accessor :request, :response

    def process(action_name)
      send action_name # index
    end
  end
end