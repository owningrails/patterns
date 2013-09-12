class HomeController < ApplicationController
  def index
    response.write "Hello from home contorller!"
  end
end