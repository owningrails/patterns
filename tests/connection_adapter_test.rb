require File.dirname(__FILE__) + '/test_helper'
require "connection_adapter"

class ConnectionAdapterTest < Test::Unit::TestCase
  def setup
    @adapter = SqliteAdapter.new
  end
  
  def test_find
    attributes = @adapter.find(1, "users")
    assert_equal 1, attributes["id"]
  end
  
  def test_find_all
    attributes = @adapter.find_all("users").first
    assert_equal 1, attributes["id"]
  end
  
  def test_columns
    assert_equal ["id", "name"], @adapter.columns("users")
  end
  
  def test_map_columns_to_values
    columns = ["id", "name"]
    values = [1, "Marc"]
    
    attributes = {"id" => 1, "name" => "Marc"}
    
    assert_equal attributes, @adapter.map_columns_to_values(columns, values)
  end
end