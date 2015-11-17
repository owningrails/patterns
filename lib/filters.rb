require 'active_support/concern'

module Filters
  extend ActiveSupport::Concern

  class_methods do
    def before_action(method)
      before_actions << method
    end

    def before_actions
      @before_actions ||= []
    end

    def after_action(method)
      after_actions << method
    end

    def after_actions
      @after_actions ||= []
    end
  end

  def process(action)
    self.class.before_actions.each { |method| send method }
    super
    self.class.after_actions.each { |method| send method }
  end
end