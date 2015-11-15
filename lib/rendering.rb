require "erb"
# To render an ERB template:
#
#   ERB.new(File.read(erb_file_path)).result(binding)

module Rendering
  def render(action_or_options)
    # TODO call render_to_string somewhere in here...
  end

  def render_to_string(action_or_options)
    # TODO ...
  end

  def template_path(action)
    "app/views/#{controller_name}/#{action}.erb"
  end

  def controller_name
    self.class.name[/^(\w+)Controller/, 1].downcase # HomeController => "home"
  end
end