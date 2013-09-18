class User < ActiveRecord::Base
  validates :name, :presence => true

  scope :search, -> query do
    where("name LIKE '%#{query}%'")
  end
end