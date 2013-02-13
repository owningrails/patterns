require File.dirname(__FILE__) + '/test_helper'
require "not_active_record"
require "models/user"

class UserTest < Test::Unit::TestCase
  def test_initialize_with_attributes
    user = User.new(id: 1, name: "Marc")
    assert_equal 1, user.id
    assert_equal "Marc", user.name
  end

  def test_find
    user = User.find(1)
    assert_equal 1, user.id
  end

  def test_all
    user = User.all.first
    assert_equal 1, user.id
  end

  def test_map_values_to_columns
    values = [1, "Marc"]
    columns = [:id, :name]
    expected_attributes = {id: 1, name: 'Marc'}

    # attributes = {}
    # columns.each_with_index do |column, i|
    #   attributes[column] = values[i]
    # end

    attributes = User.map_values_to_columns(values)

    assert_equal expected_attributes, attributes
  end

  def test_columns
    assert_equal [:id, :name], User.columns
  end

  def test_table_name
    assert_equal "users", User.table_name
  end
end

