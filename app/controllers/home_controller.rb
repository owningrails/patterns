class HomeController < ApplicationController
  before_action :header

  def index
    response.write "Hello from Home controller"
  end

  def header
    response.write "<h1>My App</h1>"
  end
end