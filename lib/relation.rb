module ActiveRecord
  class Relation
    attr_accessor :where_values

    def initialize(klass)
      @klass = klass
      @where_values = []
    end

    def where(values)
      relation = clone
      relation.where_values += [values]
      relation
    end

    def to_sql
      sql = "SELECT * FROM #{@klass.table_name}"
      sql << " WHERE " + @where_values.join(" AND ") if @where_values.any?
      sql
    end

    def to_a
      @records ||= @klass.find_by_sql(to_sql)
    end

    def method_missing(name, *args, &block)
      if @klass.respond_to?(name)
        scoping { @klass.send(name, *args, &block) }
      elsif Array.method_defined?(name)
        to_a.send(name, *args, &block)
      else
        super
      end
    end

    def scoping
      previous = @klass.current_scope
      @klass.current_scope = self
      yield
    ensure
      @klass.current_scope = previous
    end
  end
end