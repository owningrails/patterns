# Boot the framework. Similar to Rails' `config/boot.rb`.

# Activate Bundler. Set up gems listed in the Gemfile.
require 'bundler/setup'

# Add our framework code (lib/) to the load path.
$LOAD_PATH.unshift "lib"

# Add all directories of app/ to the load path.
Dir["app/*"].each do |path|
  $LOAD_PATH << path
end
