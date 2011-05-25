require "models/user"

class UsersController < Controller
  def index
    User.all.each do |user|
      response.write user.name
    end
  end
  
  def show
    user = User.find request["id"]
    response.write user.name
  end
end