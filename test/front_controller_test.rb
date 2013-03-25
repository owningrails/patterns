require File.dirname(__FILE__) + '/test_helper'

class ApplicationTest < Test::Unit::TestCase
  def setup
    @app = Application.new
  end

  def test_routing
    # assert_equal ["home", "index"], @app.route("/home/index")
    assert_equal ["home", "index"], @app.route("/")
    # assert_equal ["hello", "index"], @app.route("/hello")
    # assert_equal ["hello", "nice"], @app.route("/hello/nice")
  end

  def test_load_controller_class
    klass = @app.load_controller_class("home")
    assert_equal HomeController, klass
  end
end