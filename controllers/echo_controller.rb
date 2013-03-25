class EchoController < ApplicationController
  def index
    response.write "You said: " + request["text"]
  end
end