require_relative "../lib/boot"

# Load ActiveSupport testing stuff
require 'active_support/testing/autorun'
require 'active_support/test_case'

# Remove warning from ActiveSupport
I18n.enforce_available_locales = true
