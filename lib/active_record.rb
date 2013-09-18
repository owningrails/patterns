require "connection_adapter"
require "active_model"
require "relation"

module ActiveRecord
  class Base
    include ActiveModel::Validations

    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def method_missing(name, *args) # args = []
      if self.class.attribute_methods_generated?
        super
      else
        self.class.define_attribute_methods

        if self.class.columns.include?(name)
          send name
        else
          super
        end
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

    def self.scope(name, body)
      define_singleton_method name, &body
    end

    # Compile attribute methods

    def self.columns
      @@connection.columns(table_name)
    end

    def self.define_attribute_methods
      columns.each do |column|
        class_eval <<-RUBY
          def #{column}
            @attributes[:#{column}]
          end
        RUBY
      end
      @attribute_methods_generated = true
    end

    def self.attribute_methods_generated?
      @attribute_methods_generated
    end
  end
end