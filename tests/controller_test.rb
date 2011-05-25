require File.dirname(__FILE__) + '/test_helper'
require "controller"
require "controllers/home_controller"

class ControllerTest < Test::Unit::TestCase
  def setup
    @controller = HomeController.new
  end
  
  def test_render_to_string
    puts @controller.render_to_string("index")
  end
  
  def test_template_path
    assert_equal File.expand_path("../views/home/index.erb"), @controller.template_path("index")
  end
  
  def test_controller_name
    assert_equal "home", @controller.controller_name
  end
end