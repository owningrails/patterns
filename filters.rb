require "active_support/all"

module Filters
  extend ActiveSupport::Concern
  include ActiveSupport::Callbacks
  
  included do
    define_callbacks :process
  end
  
  module ClassMethods
    def before_filter(method)
      set_callback :process, :before, method
    end
    def after_filter(method)
      set_callback :process, :after, method
    end
    def around_filter(method)
      set_callback :process, :around, method
    end
  end
  
  def filter
    run_callbacks :process do
      yield
    end
  end
end