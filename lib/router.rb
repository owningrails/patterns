class Router
  def initialize(&block)
    @routes = {}
    instance_eval(&block)
  end

  def match(route) # match({'/' => 'home#index'})
    @routes.update route
  end

  def route(path) # /, /users, /home/index
    @routes[path].split('#') # 'home#index'.split('#') => ['home', 'index']
  end
end