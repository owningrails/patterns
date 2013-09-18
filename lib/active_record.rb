require "connection_adapter"
require "active_model"

module ActiveRecord
  class Base
    include ActiveModel::Validations

    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def method_missing(name, *args) # args = []
      columns = @@connection.columns(self.class.table_name)

      if columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      find_by_sql("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
    end

    def self.find_by_sql(sql)
      rows = @@connection.execute(sql) # [{:id=>1, :name=>"Marc", 0=>1, 1=>"Marc"}]
      rows.map do |attributes|
        new attributes
      end
    end

    def self.table_name
      name.downcase + "s" # => "users"
    end

    # Relation

    def self.all
      if current_scope
        current_scope.clone
      else
        Relation.new(self)
      end
    end

    def self.where(values)
      all.where(values)
    end

    class << self
      attr_accessor :current_scope
    end
  end
end