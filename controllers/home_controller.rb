class HomeController < Controller
  before_filter :header

  def index
    response.write "Hi from home controller"
  end

  def header
    response.write "<h1>My App</h1>"
  end
end