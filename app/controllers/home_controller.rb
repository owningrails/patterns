class HomeController < ApplicationController
  def index
    response.write "hi from HomeController"
  end
end