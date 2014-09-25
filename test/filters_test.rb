require "test_helper"
require "action_controller"
require "app/controllers/application_controller"

class FiltersTestController < ApplicationController
  # around_action :around1
  before_action :before
  # around_action :around2
  # after_action :after

  def initialize(out)
    @out = out
  end

  def before
    @out << :before
  end
  
  def after
    @out << :after
  end

  def around1
    @out << "around1"
    yield
    @out << "/around1"
  end

  def around2
    @out << "around2"
    yield
    @out << "/around2"
  end

  def index
    @out << :index
  end
end

class FiltersTest < ActiveSupport::TestCase
  def test_filters
    out = []
    FiltersTestController.new(out).process(:index)
    
    assert_equal [:before,
                  :index], out
    
    # With after_action
    # assert_equal [:before,
    #               :index,
    #               :after], out

    # With around_actions
    # assert_equal ["around1",
    #                 :before,
    #                 "around2",
    #                   :index,
    #                   :after,
    #                 "/around2",
    #               "/around1"], out
  end
end