class HomeController < Controller
  around_filter :layout
  around_filter :layout2
  before_filter :header
  after_filter :footer
  
  def index
    @message = "This class is awesome!"
    render :index
  end
  
  def nice
    render :text => "Hi, this is nice!"
  end
  
  def header
    response.write "<h1>Hello</h1>"
  end
  
  def footer
    response.write "<p>&copy; me</p>"
  end
  
  def layout
    response.write "<html><body>"
    yield
    response.write "</body></html>"
  end
  
  def layout2
    response.write "{"
    yield
    response.write "}"
  end
end