class EchoController < ApplicationController
  def index
    response.write "You said: " + request.params["text"]
  end
end