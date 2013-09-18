require "core_ext"

$LOAD_PATH.unshift "app/controllers", "app/models", "config"

class Object
  def self.const_missing(name)
    # :ActionController => action_controller
    file_name = name.to_s.underscore
    require file_name
    const_get name
  end
end