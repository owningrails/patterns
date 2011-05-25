$:.unshift "."
require "front_controller"

use Rack::Static, :urls => ["/favicon.ico"]

run FrontController.new