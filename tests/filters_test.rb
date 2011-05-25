require File.dirname(__FILE__) + '/test_helper'
require "controller"

class TestController < Controller
  around_filter :around
  before_filter :one
  before_filter :two
  after_filter :three
  
  def initialize(out)
    @out = out
  end
  
  def one
    @out << 1
  end
  
  def two
    @out << 2
  end
  
  def three
    @out << 3
  end
  
  def around
    @out << "{"
    yield
    @out << "}"
  end
end

class FiltersTest < Test::Unit::TestCase
  def test_store_filters
    assert_equal [:one, :two], TestController.before_filters
  end
  
  def test_filter
    out = []
    TestController.new(out).filter do
      out << :process
    end
    assert_equal ["{", 1, 2, :process, 3, "}"], out
  end
end