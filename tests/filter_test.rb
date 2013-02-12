require File.dirname(__FILE__) + '/test_helper'
require "controller"

class TestController < Controller
  around_filter :around1
  before_filter :one
  before_filter :two
  after_filter :three
  around_filter :around2

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
    @out << "1["
    yield
    @out << "]1"
  end

  def around2
    @out << "2["
    yield
    @out << "]2"
  end

  def index
    @out << :index
  end
end

class FiltersTest < Test::Unit::TestCase
  # def test_store_filters
  #   assert_equal [:one, :two], TestController.before_filters
  #   assert_equal [:three], TestController.after_filters
  # end

  def test_filtering
    out = []
    TestController.new(out).process(:index)
    assert_equal ["1[", :one, :two, "2[", :index, "]2", :three, "]1"], out
  end
end

