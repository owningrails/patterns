class EchoController < ApplicationController
  def index
    # response.write "You said: " + request.params["text"]
    render text: "You said: " + params["text"]
  end
end