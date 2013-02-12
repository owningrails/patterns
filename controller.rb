require "active_record"

class Controller
  attr_accessor :request, :response

  def process(action)
    send action
  end

  def params
    request.params
  end
end