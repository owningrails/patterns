require File.dirname(__FILE__) + '/test_helper'
require "front_controller"

class FrontControllerTest < Test::Unit::TestCase
  def setup
    @front = FrontController.new
  end
  
  def test_routing
    assert_equal ["home", "index"], @front.route("/home/index")
    assert_equal ["home", "index"], @front.route("/")
    assert_equal ["users", "new"], @front.route("/users/new")
    assert_equal ["users", "index"], @front.route("/users")
  end
  
  def test_load_controller_class
    klass = @front.load_controller_class("home") # => HomeController
    assert_equal HomeController, klass
  end
end