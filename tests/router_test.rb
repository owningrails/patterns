require File.dirname(__FILE__) + '/test_helper'
require "router"

class RouterTest < Test::Unit::TestCase
  def test_routing
    router = Router.new do
      match '/' => 'home#index'
      match '/login' => 'sessions#new'
    end
    assert_equal ['home', 'index'], router.recognize('/')
    assert_equal ['sessions', 'new'], router.recognize('/login')
  end
end