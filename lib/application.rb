require "action_controller"
require "app/controllers/application_controller"
require "router"
require "config/routes"

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
    Routes.route(path)
  end

  def load_controller_class(name)
    require "app/controllers/#{name}_controller"
    Object.const_get name.capitalize + "Controller" # "HomeController" => HomeController
  end
end