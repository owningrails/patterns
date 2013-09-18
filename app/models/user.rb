class User < ActiveRecord::Base
  validates :name, :presence => true

  def self.search(query)
    where("name LIKE '%#{query}%'")
  end
end