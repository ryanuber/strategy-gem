require 'spec_helper'

describe 'Plan' do
  before :all do
    @plan = Strategy::Plan.new 'Test Plan'

    step = Strategy::Step.new 'Step 1'
    step.action { puts 1 }
    @plan.add step

    step = Strategy::Step.new 'Step 2'
    step.action { puts 2 }
    @plan.add step
  end

  it 'should add a description to the plan' do
    expect(@plan.name).to eq('Test Plan')
  end

  it 'should accept new steps' do
    step = Strategy::Step.new 'Step 3'
    step.action { puts 3 }
    @plan.add step
    expect(@plan.steps.length).to eq(3)
  end

  it 'should reflect the proper plan name' do
    expect(@plan.describe).to include('Test Plan')
  end

  it 'should error if a non-step object is passed' do
    expect { @plan.add 0 }.to raise_error
  end

  it 'should reflect all steps in the plan' do
    expect(@plan.describe).to include('Step 1')
    expect(@plan.describe).to include('Step 2')
    expect(@plan.describe).to include('Step 3')
  end

  it 'should execute all of the steps' do
    expect { @plan.execute! }.to output("1\n2\n3\n").to_stdout
  end

  it 'should yield step number and description if block given' do
    expect { @plan.execute! { |n, d| puts "#{n}. #{d}" } }.to \
      output("1. Step 1\n1\n2. Step 2\n2\n3. Step 3\n3\n").to_stdout
  end
end
