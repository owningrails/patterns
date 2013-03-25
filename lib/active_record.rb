require "connection_adapter"
require "active_model"

module ActiveRecord
  class Base
    include ActiveModel::Validations

    @@connection = SqliteAdapter.new

    def initialize(attributes={})
      @attributes = attributes
    end

    def method_missing(name, *args)
      if self.class.columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      find_by_sql("SELECT * FROM #{table_name} WHERE id = #{id.to_i} LIMIT 1").first
    end

    def self.find_by_sql(sql)
      rows = @@connection.execute(sql)
      rows.map do |attributes| # { id: 1, name: "Marc" }
        new(attributes)
      end
    end

    def self.columns
      @@connection.columns(table_name)
    end

    def self.table_name
      name.downcase + 's' # "users"
    end

    ############ EXERCISE ###########

    def self.all
      find_by_sql("SELECT * FROM #{table_name}")
    end

    ############ BONUS ############

    def self.define_attribute_methods
      columns.each do |column|
        # (class_eval == module_eval)
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

    def method_missing(name, *args)
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
  end
end