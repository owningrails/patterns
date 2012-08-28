require File.dirname(__FILE__) + '/test_helper'
require "controller"

class TestController < Controller
  around_filter :around1
  around_filter :around2
  before_filter :one
  before_filter :two
  after_filter :three
  
  def initialize(out)
    @out = out
  end
  
  def one
    @out << :one
  end
  
  def two
    @out << :two
  end
  
  def three
    @out << :three
  end
  
  def around1
    @out << "{"
    yield
    @out << "}"
  end
  
  def around2
    @out << "["
    yield
    @out << "]"
  end
end

class FiltersTest < Test::Unit::TestCase
  def test_store_filters
    assert_equal [:one, :two], TestController.before_filters
    assert_equal [:three], TestController.after_filters
  end
  
  def test_filtering
    out = []
    TestController.new(out).filter do
      out << :process
    end
    assert_equal ["{", "[", :one, :two, :process, :three, "]", "}"], out
  end
end