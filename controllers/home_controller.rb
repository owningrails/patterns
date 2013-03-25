class HomeController < ApplicationController
  before_filter :header

  def index
    @message = "This is a message"
    # render :index
  end

  def header
    response.write "<h1>My App</h1>"
  end
end