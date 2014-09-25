require "test_helper"
require "action_controller"
require "application_controller"
require "home_controller"

class RenderingTest < ActiveSupport::TestCase
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