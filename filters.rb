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
  end

  def process(action)
    self.class.before_filters.each { |method| send method }
    super
  end
end