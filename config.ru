# Start with: shotgun
# Under Windows: rackup  (CTRL+C and restart on each change)


Routes = {
  "GET" => {
    # "path" => block
  }
}

def get(path, &block)
  Routes["GET"][path] = block
end

get "/" do
  "awesome!"
end

run -> env do
  method = env["REQUEST_METHOD"]
  path = env["PATH_INFO"]
  
  if block = Routes[method][path]
    body = block.call
    [200, {}, [body]]
  else
    [404, {}, ["Not found"]]
  end
end
