$LOAD_PATH.unshift 'app/controllers', 'app/models', 'config'

class String
  def underscore
    gsub(/(.)([A-Z])/, '\1_\2').downcase
  end
end

class Object
  def self.const_missing(name)
    file_name = name.to_s.underscore

    ###### DEBUG
    # Prevent recursive lookup
    # $AUTOLOADED_FILES ||= {}
    # raise "Already loaded" if $AUTOLOADED_FILES[file_name]
    # $AUTOLOADED_FILES[file_name] = true

    require file_name
    const_get name
  end
end