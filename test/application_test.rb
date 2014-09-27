require "test_helper"
require "application"

class ApplicationTest < ActiveSupport::TestCase
  def setup
    @app = Application.new
  end

  def test_case_name
    assert_equal ["home", "index"], @app.route("/home/index")
    assert_equal ["users", "new"], @app.route("/users/new")
    assert_equal ["home", "index"], @app.route("/")
  end

  def test_load_controller_class
    klass = @app.load_controller_class("home")
    assert_equal HomeController, klass
  end
end