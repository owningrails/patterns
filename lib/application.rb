require "action_controller"
require "app/controllers/application_controller"

class Application
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = route(request.path_info)

    controller_class = load_controller_class(controller_name) # "home" => HomeController
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process(action_name) # index

    response.finish
  end

  def route(path)
    _, controller, action = path.split("/") # => /home/index => ["", "home", "index"]
    [controller || "home", action || "index"]
  end

  def load_controller_class(name)
    require "app/controllers/#{name}_controller"
    Object.const_get name.capitalize + "Controller" # "HomeController" => HomeController
  end
end