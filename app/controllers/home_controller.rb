class HomeController < ApplicationController
  before_action :header

  def index
    @message = "This is a messagr from the controller"
    render :index
  end

  def header
    response.write "<h1>My App</h1>"
  end
end