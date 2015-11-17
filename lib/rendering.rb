require "erb"
# To render an ERB template:
#
#   ERB.new(File.read(erb_file_path)).result(binding)

module Rendering
  def render(action_or_options)
    response.write render_to_string(action_or_options)
  end

  def render_to_string(action_or_options)
    if action_or_options.is_a? Symbol
      options = { action: action_or_options }
    else
      options = action_or_options
    end

    if options[:text]
      options[:text]
    elsif options[:action]
      render_template template_path(options[:action])
    else
      raise ArgumentError, "Nothing to render"
    end
  end

  def template_path(action)
    "app/views/#{controller_name}/#{action}.erb"
  end

  def controller_name
    self.class.name[/^(\w+)Controller/, 1].downcase # HomeController => "home"
  end

  private
    def render_template(path)
      ERB.new(File.read(path)).result(binding)
    end
end