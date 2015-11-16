require "test_helper"
require "action_controller"
require "application_controller"

class FiltersTestController < ApplicationController
  before_action :before
  after_action :after

  def initialize(out)
    @out = out
  end

  def before
    @out << :before
  end
  
  def after
    @out << :after
  end

  def index
    @out << :index
  end
end

class FiltersTest < ActiveSupport::TestCase
  def test_filters
    out = []
    FiltersTestController.new(out).process(:index)
    
    # assert_equal [:before,
    #               :index], out
    
    # With after_action
    assert_equal [:before,
                  :index,
                  :after], out
  end
end