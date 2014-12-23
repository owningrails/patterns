require File.dirname(__FILE__) + '/test_helper'
require "autoloading"

class AutoloadingTest < ActiveSupport::TestCase
  def test_return_const
    const = Object.const_missing(:ActionController)
    assert_equal ActionController, const
  end

  def test_require_from_app
    const = Object.const_missing(:User)
    assert_equal User, const
  end
end