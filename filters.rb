require "active_support/all"

module Filters
  def self.included(base)
    base.extend ClassMethods
  end
  
  module ClassMethods
    def before_filter(method)
      before_filters << method
    end
    
    def before_filters
      @before_filters ||= []
    end
    
    def after_filter(method)
      after_filters << method
    end
    
    def after_filters
      @after_filters ||= []
    end
    
    def around_filter(method)
      around_filters << method
    end
    
    def around_filters
      @around_filters ||= []
    end
  end
  
  def filter
    process_proc = proc do
      self.class.before_filters.each { |method| send(method) }
      yield
      self.class.after_filters.each { |method| send(method) }
    end
    
    self.class.around_filters.reverse.each do |method|
      previous_proc = process_proc
      process_proc = proc { send(method, &previous_proc) }
    end
    
    process_proc.call
  end
end