module Filters
  def self.included(base)
    base.extend ClassMethods
  end

  module ClassMethods
    def before_filter(method)
      around_filter do |controller, action|
        controller.send method
        action.call
      end
    end

    def after_filter(method)
      around_filter do |controller, action|
        action.call
        controller.send method
      end
    end

    def around_filters
      @around_filters ||= []
    end

    # around_filter :method
    # def method
    #   yield # action.call
    # end
    #
    # around_filter { |controller, action| }
    def around_filter(method=nil, &block)
      if block
        around_filters << block
      else
        around_filters << proc { |controller, action| controller.send method, &action }
      end
    end
  end

  def process(action)
    # around_filter :one
    # around_filter :two

    # proc do # one
    #   proc do # two
    #     proc { super }.call
    #   end.call
    # end.call

    self.class.around_filters.reverse.inject(proc { super }) do |parent_proc, filter|
      proc { filter.call(self, parent_proc) }
    end.call
  end
end