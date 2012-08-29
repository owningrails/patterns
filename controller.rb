require "active_record"
require "filters"
require "rendering"

class AbstractController
  def process(action)
    send(action)
  end
end

class Controller < AbstractController
  attr_accessor :request, :response
  
  include Filters, Rendering
end