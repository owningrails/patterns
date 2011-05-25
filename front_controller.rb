require "controller"

class FrontController
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    
    controller_name, action_name = route(request.path_info)
    
    controller_class = load_controller_class(controller_name)
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.send(action_name)
    
    response.finish
  end
  
  def route(url)
    _, controller_name, action_name = url.split("/")
    [controller_name || "home", action_name || "index"]
  end
  
  def load_controller_class(name)
    require "controllers/#{name}_controller" # home_controller
    class_name = name.capitalize + "Controller" # HomeController
    Object.const_get(class_name)
  end
end