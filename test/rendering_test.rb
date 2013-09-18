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

  def test_compile_template
    method_name = @controller.compile_template(@controller.template_path("index"))
    assert_respond_to @controller, method_name
    assert_match "<p>", @controller.send(method_name)
  end

  def test_render_view
    assert_match "<p>", @controller.render_to_string("index")
  end

  def test_render_layout
    assert_match "<head>", @controller.render_to_string("index")
  end

  def test_content_for
    assert_match "<title>Hello</title>", @controller.render_to_string("index")
  end
end