# Start with: shotgun
# Under Windows: rackup  (CTRL+C and restart on each change)

class App
  def call(env)
    [
      200,
      { "Content-Type" => "text/plain" },
      [env["PATH_INFO"]]
    ]
  end
end

class Logger
  def initialize(app)
    @app = app
  end

  def call(env)
    puts "Calling " + env["PATH_INFO"]
    @app.call(env)
  end
end

use Logger

run App.new