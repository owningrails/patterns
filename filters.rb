require "active_support/concern"
require "active_support/callbacks"

module Filters
  extend ActiveSupport::Concern
  
  included do
    include ActiveSupport::Callbacks
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
  
  def process(*)
    run_callbacks :process do
      super
    end
  end
end