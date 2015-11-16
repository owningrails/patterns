class HomeController < ApplicationController
  def index
    response.write "Hello from Home controller"
  end
end