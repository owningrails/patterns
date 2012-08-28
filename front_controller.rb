require "controller"
require "router"
require "routes"

class FrontController
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    
    # controller_name, action_name = route(request.path_info)
    controller_name, action_name = Routes.recognize(request.path_info)
    
    controller_class = load_controller_class(controller_name)
    
    controller = controller_class.new
    controller.request = request
    controller.response = response
    
    controller.filter do
      controller.send(action_name)
      controller.render(action_name) unless controller.rendered?
    end
    
    response.finish
  end
  
  def route(path)
    _, controller, action = path.split("/") # /home/index => ["", "home", "index"]
    [controller || "home", action || "index"]
  end
  
  def load_controller_class(name)
    require "controllers/#{name}_controller"
    Object.const_get(name.capitalize + "Controller") # "HomeController"
  end
end
