module Filtering
  def self.included(base) # base == ActionController::Base
    base.extend ClassMethods
  end

  module ClassMethods
    def before_action(method)
      before_actions << method
    end

    def before_actions
      @before_actions ||= []
    end
  end

  def process(action_name)
    self.class.before_actions.each { |method| send method }
    super
  end
end