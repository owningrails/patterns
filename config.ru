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

run App.new