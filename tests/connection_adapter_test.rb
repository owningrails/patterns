require File.dirname(__FILE__) + '/test_helper'
require "connection_adapter"

class ConnectionAdapterTest < Test::Unit::TestCase
  def setup
    @adapter = SqliteAdapter.new
  end
  
  def test_execute
    row = @adapter.execute("SELECT * FROM users").first
    assert_equal [1, "Marc"], row
  end
  
  def test_columns
    assert_equal [:id, :name], @adapter.columns("users")
  end
end