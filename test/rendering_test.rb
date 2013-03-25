require File.dirname(__FILE__) + '/test_helper'

class RenderingTest < Test::Unit::TestCase
  def setup
    @controller = HomeController.new
  end

  def test_template_path
    assert_equal File.expand_path("../../app/views/home/index.erb", __FILE__), @controller.template_path("index")
  end

  def test_controller_name
    assert_equal "home", @controller.controller_name
  end
end