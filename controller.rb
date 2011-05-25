require "filters"

class Controller
  attr_accessor :request, :response
  
  include Filters
  
  def render(options)
    case options
    when String, Symbol
      out = render_to_string(options) # <= oops
    when Hash
      out = options[:text]
    end
    @rendered = true
    response.write out
  end
  
  def render_to_string(template)
    path = template_path(template)
    ERB.new(File.read(path)).result(binding)
  end
  
  def template_path(template)
    File.dirname(__FILE__) + "/views/#{controller_name}/#{template}.erb"
  end
  
  def controller_name
    self.class.name[/^(\w+)Controller$/, 1].downcase
  end
  
  def rendered?
    @rendered
  end
end