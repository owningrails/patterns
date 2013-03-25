# require "autoloading"
# require "controller"
# require "router"
# require "routes"

class FrontController
  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new

    controller_name, action_name = Routes.recognize(request.path_info)

    controller_class = load_controller_class(controller_name)
    controller = controller_class.new
    controller.request = request
    controller.response = response
    controller.process action_name

    response.finish
  end

  def load_controller_class(name)
    # "home" => HomeController
    # require "controllers/#{name}_controller"
    Object.const_get name.capitalize + "Controller" # "HomeController"
  end
end
