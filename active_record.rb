require "connection_adapter"

module ActiveRecord
  class Base
    @@connection = SqliteAdapter.new

    def initialize(attributes)
      @attributes = attributes
    end

    def method_missing(name, *arg)
      name = name.to_s
      columns = @@connection.columns(self.class.table_name)
      
      if columns.include?(name)
        @attributes[name]
      else
        super
      end
    end

    def self.find(id)
      attributes = @@connection.find(id, table_name)
      new(attributes)
    end

    def self.all
      @@connection.find_all(table_name).map { |attributes| new(attributes) }
    end
    
    def self.table_name
      name.downcase + "s"
    end
  end
end