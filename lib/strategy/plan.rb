module Strategy
  # Plan is a wrapper around a set of executable steps. It maintains a runbook
  # of what to do and how to do it, and provides an easy way of displaying an
  # execution plan or "strategy" before executing anything. A Plan object is the
  # highest-level container around an execution strategy, and may contain as few
  # or as many Step objects as required.
  class Plan
    attr_reader :name, :steps

    # Create a new plan, to which individual execution steps will be added.
    #
    # == Parameters:
    # name::
    #   The name of the execution plan. This is a short sentence which
    #   describes what the plan will do.
    #
    def initialize name
      @name = name
      @steps = []
    end

    # Adds a step object to the execution plan. Each step carries its own set of
    # actions, description, and so on.
    #
    # == Parameters:
    # step::
    #   A Strategy::Step object encapsulating some actions
    #
    def add step
      if !step.kind_of? Step
        raise TypeError, "Expected Strategy::Step but got #{step.class}"
      end
      @steps << step
    end

    # Iterate over all steps contained in the plan and execute them. This method
    # will yield the step number and description if a block is given, which
    # enables one to print out a step banner just before execution if desired.
    def execute!
      n = 0
      @steps.each do |step|
        n += 1
        if block_given?
          yield n, step.name
        end
        step.execute!
      end
    end

    # Describe the plan itself and all steps involved. This method puts together
    # a textual representation of the execution plan which can be displayed to a
    # user before executing anything for confirmation.
    def describe
      description = [@name]
      n = 0
      @steps.each do |step|
        description << "  #{n+=1}. #{step.name}"
      end
      description.join "\n"
    end
  end
end
