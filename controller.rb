require "active_record"
require "filters"

class ControllerBase
  attr_accessor :request, :response

  def process(action)
    send action
  end

  def params
    request.params
  end
end

class Controller < ControllerBase
  include Filters
end