$:.unshift "."
require "front_controller"

class Logger
  def initialize(app)
    @app = app
  end
  
  def call(env)
    puts "Calling " + env["PATH_INFO"]
    @app.call(env)
  end
end

use Logger

run FrontController.new