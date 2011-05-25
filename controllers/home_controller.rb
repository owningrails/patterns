class HomeController < Controller
  before_filter :header
  
  def index
    response.write "Hello from Home controller"
  end
  
  def nice
    response.write "Hi, this is nice!"
  end
  
  def header
    response.write "<h1>Hello</h1>"
  end
end