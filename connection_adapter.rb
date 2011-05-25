class ConnectionAdapter
  def find(id, table_name)
    rows = execute("select * from #{table_name} where id = #{id} limit 1")
    columns = columns(table_name)
    
    map_columns_to_values columns, rows.first
  end
  
  def find_all(table_name)
    rows = execute("select * from #{table_name}")
    columns = columns(table_name)
    
    rows.map { |row| map_columns_to_values columns, row }
  end
  
  def columns(table_name)
    table_info(table_name).map { |info| info["name"] }
  end
  
  def map_columns_to_values(columns, values)
    Hash[columns.zip(values)]
  end
end

class SqliteAdapter < ConnectionAdapter
  def initialize
    require "sqlite3"
    @db = SQLite3::Database.new(File.dirname(__FILE__) + "/db/app.db")
  end
  
  def execute(sql)
    @db.execute(sql)
  end
  
  def table_info(table)
    @db.table_info(table)
  end
end

class MysqlAdapter < ConnectionAdapter
  
end