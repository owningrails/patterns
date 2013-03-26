$LOAD_PATH.unshift 'app/controllers', 'app/models', 'config'

class String
  def underscore
    gsub(/(.)([A-Z])/, '\1_\2').downcase
  end
end

class Object
  def self.const_missing(name)
    file_name = name.to_s.underscore

    # Prevent recursive lookup
    # @looked_for_consts ||= {}
    # super if @looked_for_consts[file_name]
    # @looked_for_consts[file_name] = true

    require file_name
    const_get name
  end
end