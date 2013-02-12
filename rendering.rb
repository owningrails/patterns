require "erb"

module Rendering
  def render(action)
    response.write render_to_string(action)
  end

  def render_to_string(action)
    path = template_path(action)
    ERB.new(File.read(path)).result(binding)
  end

  def template_path(action)
    File.expand_path("../views/#{controller_name}/#{action}.erb", __FILE__)
  end

  def controller_name
    self.class.name[/^(\w+)Controller/, 1].downcase # "home"
  end
end