require 'spec_helper'

describe 'Creating a plan' do
  it 'should add a description to the plan' do
    plan = Strategy::Plan.new 'Test Plan'
    expect(plan.name).to eq('Test Plan')
  end
end

describe 'Using a plan' do
  it 'should accept new steps' do
    plan = Strategy::Plan.new 'Test Plan'

    step = Strategy::Step.new 'Step 1'
    plan.add step
    plan.add step

    expect(plan.steps.length).to eq(2)
  end
end
