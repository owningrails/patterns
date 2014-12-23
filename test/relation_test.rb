require File.dirname(__FILE__) + '/test_helper'
require "active_record"
require "relation"

class RelationTest < ActiveSupport::TestCase
  def setup
    @relation = ActiveRecord::Relation.new(User)
  end

  def test_where
    relation = @relation.where("name = 'Marc'")
    assert_equal "SELECT * FROM users WHERE name = 'Marc' AND id = 1", relation.where("id = 1").to_sql
    assert_equal "SELECT * FROM users WHERE name = 'Marc'", relation.to_sql
  end

  def test_order
    relation = @relation.order(:name)
    assert_equal "SELECT * FROM users ORDER BY name", relation.to_sql
  end

  def test_execute_on_to_a
    user = @relation.where("id = 1").to_a.first
    assert_kind_of User, user
  end

  def test_proxy_method_to_a
    user = @relation.where("id = 1").first
    assert_kind_of User, user
  end

  def test_model_delegate_to_relation
    user = User.where("id = 1").first
    assert_kind_of User, user
  end

  def test_named_scope
    sql = User.where("id = 1").search("Marc").to_sql
    assert_equal "SELECT * FROM users WHERE id = 1 AND name LIKE '%Marc%'", sql
  end
end