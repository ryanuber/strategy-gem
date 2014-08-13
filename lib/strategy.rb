require 'strategy/step'
require 'strategy/plan'

module Strategy
  # Convenience function to get a new Step quickly
  #
  # == Parameters:
  # desc::
  #   The description of the new step
  #
  # == Returns:
  # A Strategy::Step with the specified description
  #
  def self.step desc
    Strategy::Step.new desc
  end

  # Convenience function to get a new Plan quickly
  #
  # == Parameters:
  # desc::
  #   The description of the new plan
  #
  # == Returns:
  # A Strategy::Plan with the specified description
  #
  def self.plan desc
    Strategy::Plan.new desc
  end
end
