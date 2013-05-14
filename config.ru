# Start with: shotgun -I. -Ilib
# Under Windows: rackup -I. -Ilib  (CTRL+C and restart on each change)

class App
  def call(env)
    # Return the response array here
  end
end

run App.new