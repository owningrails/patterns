class HomeController < Controller
  before_filter :header
  
  def index
    response.write "Hello from home controller!"
  end
  
  def nice
    response.write "This is nice!"
  end
  
  def header
    response.write "<h1>My App</h1>"
  end
end