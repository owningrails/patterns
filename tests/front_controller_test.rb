require File.dirname(__FILE__) + '/test_helper'
require "front_controller"

class FrontControllerTest < Test::Unit::TestCase
  def setup
    @front = FrontController.new
  end

  def test_routing
    assert_equal ["home", "index"], @front.route("/home/index")
    assert_equal ["home", "index"], @front.route("/")
    assert_equal ["hello", "index"], @front.route("/hello")
    assert_equal ["hello", "nice"], @front.route("/hello/nice")
  end

  def test_load_controller_class
    klass = @front.load_controller_class("home")
    assert_equal HomeController, klass
  end
end