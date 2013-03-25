require File.dirname(__FILE__) + '/test_helper'

class AutoloadingTest < Test::Unit::TestCase
  def test_underscore
    assert_equal "action_controller", "ActionController".underscore
  end

  def test_require_and_load
    const = Object.const_missing(:ActionController)
    assert_equal ActionController, const
  end
end