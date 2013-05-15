require File.dirname(__FILE__) + '/test_helper'
require "action_controller"
require "app/controllers/application_controller"
require "app/controllers/home_controller"

class RenderingTest < Test::Unit::TestCase
  def setup
    @controller = HomeController.new
  end

  def test_template_path
    assert_equal "app/views/home/index.html.erb", @controller.template_path("index")
  end

  def test_controller_name
    assert_equal "home", @controller.controller_name
  end
end