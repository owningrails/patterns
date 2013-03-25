class Router
  def initialize(&block)
    @routes = {}
    instance_eval(&block)
  end

  def match(options)
    options.each_pair do |path, controller_action|
      # "/" => ["home", "index"]
      @routes[path] = controller_action.split("#")
    end
  end

  def recognize(path)
    @routes[path]
  end
end