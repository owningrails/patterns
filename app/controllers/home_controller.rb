class HomeController < ApplicationController
  def index
    render :index # renders app/views/home/index.erb
  end
end