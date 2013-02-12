class Controller
  attr_accessor :request, :response

  def process(action)
    send action
  end
end