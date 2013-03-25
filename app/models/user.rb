class User < NotActiveRecord::Base
  validates :name, :presence => true
end