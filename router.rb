class Router
  def initialize(&block)
    @routes = {}
    instance_eval(&block) if block
  end
  
  def match(options) # {'/' => 'home#index}
    path, action = options.first # [key, value]
    @routes[path] = action.split('#') # home, index
  end
  
  def recognize(path_info)
    @routes[path_info]
  end
end