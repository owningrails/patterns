$LOAD_PATH.concat ['.', 'controllers', 'models']

def Object.const_missing(name)
  file_name = name.to_s.gsub(/(.)([A-Z])/, '\1_\2').downcase
  puts "Autoloading #{name} from #{file_name}"
  require file_name
  const_get name
end