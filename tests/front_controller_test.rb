require File.dirname(__FILE__) + '/test_helper'
require "front_controller"

class FrontControllerTest < Test::Unit::TestCase
  def setup
    @controller = FrontController.new
  end
  
  def test_routing
    assert_equal ["home", "index"], @controller.route("/home/index")
    assert_equal ["home", "index"], @controller.route("/home")
    assert_equal ["home", "index"], @controller.route("/")
  end
  
  def test_load_controller_class
    klass = @controller.load_controller_class("home")
    assert_equal HomeController, klass
  end
end