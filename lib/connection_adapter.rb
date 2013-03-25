class SqliteAdapter
  def initialize
    require "sqlite3"
    @db = SQLite3::Database.new(File.dirname(__FILE__) + "/../db/app.db", results_as_hash: true)
  end

  # Execute an SQL query and return the results as a hash, eg.: { id: 1, name: "Marc" }.
  def execute(sql)
    @db.execute(sql).each do |row|
      row.keys.each { |key| row[(key.to_sym rescue key) || key] = row.delete(key) } # Symbolize keys
    end
  end

  # Return the column names of a table.
  def columns(table_name)
    @db.table_info(table_name).map { |info| info["name"].to_sym }
  end
end

class MysqlAdapter
  def execute(sql)
    # Here we'd implement executing the query in MySQL.
  end
end