class HomeController < Controller
  def index
    response.write "Hi from home controller"
  end
end