require "erb"

module Rendering
  def render(action)
    response.write render_to_string(action)
  end

  def render_to_string(action)
    path = template_path(action)
    method = compile_template(path)
    content_for :layout, send(method)

    layout_method = compile_template("app/views/layouts/application.html.erb")
    send(layout_method) { |name = :layout| @content_for[name] }
  end

  def content_for(name, content)
    @content_for ||= {}
    @content_for[name] = content
  end

  def compile_template(path)
    method_name = path.gsub(/\W/, '_')

    unless respond_to?(method_name)
      template = ERB.new(File.read(path))
      class_eval <<-CODE
        def #{method_name}
          #{template.src}
        end
      CODE
    end

    method_name
  end

  def template_path(action)
    "app/views/#{controller_name}/#{action}.html.erb"
  end

  def layout_path
    "app/views/layouts/application.html.erb"
  end

  def controller_name
    self.class.name[/^(\w+)Controller/, 1].downcase # HomeController => "home"
  end
end