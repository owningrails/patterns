require "active_support/all"

module Filters
  def self.included(base)
    base.extend ClassMethods
    base.class_attribute :before_filters
    base.before_filters = []
  end
  
  module ClassMethods
    def before_filter(method)
      self.before_filters += [method]
    end
  end
  
  def filter
    before_filters.each { |method| send(method) }
    yield
  end
end