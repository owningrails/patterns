require File.dirname(__FILE__) + '/test_helper'
require "controller"

class TestController < Controller
  before_filter :one
  before_filter :two
  
  def initialize(out)
    @out = out
  end
  
  def one
    @out << :one
  end
  
  def two
    @out << :two
  end
end

class FiltersTest < Test::Unit::TestCase
  def test_store_filters
    assert_equal [:one, :two], TestController.before_filters
  end
  
  def test_filtering
    out = []
    TestController.new(out).filter do
      out << :process
    end
    assert_equal [:one, :two, :process], out
  end
end