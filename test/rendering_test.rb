require "test_helper"
require "action_controller"
require "application_controller"
require "home_controller"

class RenderingTest < ActiveSupport::TestCase
  def setup
    @controller = HomeController.new
  end

  def test_template_path
    assert_equal "app/views/home/index.erb", @controller.template_path("index")
  end

  def test_controller_name
    assert_equal "home", @controller.controller_name
  end

  def test_render_text
    assert_equal "some text", @controller.render_to_string(text: "some text")
  end

  def test_render_action_as_hash
    assert_match /^<p>/, @controller.render_to_string(action: :index)
  end

  def test_render_action_as_symbol
    assert_match /^<p>/, @controller.render_to_string(:index)
  end
end