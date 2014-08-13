require 'spec_helper'

describe 'Step' do
  before :all do
    @step = Strategy::Step.new 'Test Step'
  end

  it 'should create a new step with proper name' do
    expect(@step.name).to eq('Test Step')
  end

  it 'should add an action properly' do
    @step.action { puts 1 }
    expect(@step.actions.length).to eq(1)
  end

  it 'should allow multiple actions to be added' do
    @step.action { puts 2 }
    expect(@step.actions.length).to eq(2)
  end

  it 'should raise an error if no block is given for an action' do
    expect { @step.action }.to raise_error
  end

  it 'should execute all actions in the step in order' do
    expect { @step.execute! }.to output("1\n2\n").to_stdout
  end
end
