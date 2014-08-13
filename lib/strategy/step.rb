module Strategy
  # Step encapsulates a single step in a larger plan of execution. A step
  # contains a set of actions, which are the actual pieces of executable
  # code, as well as a high-level description of what the step accomplishes.
  class Step
    attr_reader :description, :actions

    # Creates a new Step, which can later be added to a Plan.
    #
    # == Parameters:
    # description::
    #   The description of the step. This is a high-level description of what
    #   the step is supposed to accomplish.
    #
    def initialize description
      @description = description
      @actions = []
    end

    # Adds a new action to the step. Actions are given as a code block, and
    # will be executed in the order they are added (if the step is executed).
    def action &block
      if block.nil?
        raise RuntimeError, 'expected a block but none given'
      end
      @actions << block
    end

    # Execute all actions sequentially as they appear in the Step.
    def execute!
      @actions.each do |action|
        action.call
      end
    end
  end
end
