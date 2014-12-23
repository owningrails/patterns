Dir.chdir File.expand_path("../../", __FILE__)
$LOAD_PATH.unshift ".", "lib", "test"

# Load ActiveSupport testing stuff
require 'active_support/testing/autorun'
require 'active_support/test_case'

I18n.enforce_available_locales = true

require "autoloading"