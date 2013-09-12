module Filters
  def self.included(base) # base == Base
    base.extend ClassMethods
  end

  module ClassMethods
    def before_action(method)
      around_action do |controller, action_proc|
        controller.send method
        action_proc.call
      end
    end
    
    def after_action(method)
      around_action do |controller, action_proc|
        action_proc.call
        controller.send method
      end
    end
    
    # around_action :method
    # def method
    #   yield
    # end
    #
    # around_action { |controller, action_proc| action_proc.call }
    def around_action(method=nil, &block)
      if block
        around_actions << block
      else
        around_actions << proc { |controller, action_proc| controller.send method, &action_proc }
      end
    end

    def around_actions
      @around_actions ||= []
    end
  end

  def process(action)
    # around_action :one
    # around_action :two

    # def one
    #   yield
    # end
    # def two
    #   yield
    # end

    # proc do
      # one do
      #   two do
      #     super
      #   end
      # end
    # end

    action_proc = proc { super }
    self.class.around_actions.reverse.each do |filter_block|
      current_action = action_proc
      action_proc = proc { filter_block.call(self, current_action) }
    end

    action_proc.call
  end
end

