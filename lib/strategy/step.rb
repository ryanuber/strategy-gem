module Strategy
  # Step encapsulates a single step in a larger plan of execution. A step
  # contains a set of actions, which are the actual pieces of executable
  # code, as well as a high-level description of what the step accomplishes.
  class Step
    attr_reader :name, :actions

    # Creates a new Step, which can later be added to a Plan.
    #
    # == Parameters:
    # name::
    #   The name of the step. This is a high-level description of what the
    #   step is supposed to accomplish.
    #
    def initialize name
      @name = name
      @actions = []
    end

    # Adds a new action to the step. Actions are given as a code block, and
    # will be executed in the order they are added (if the step is executed).
    def action &block
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
