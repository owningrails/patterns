class HomeController < Controller
  def index
    response.write "Hello from Home controller"
  end
  
  def nice
    response.write "Hi, this is nice!"
  end
end