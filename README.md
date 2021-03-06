# strategy (gem) [![Build Status](https://travis-ci.org/ryanuber/strategy-gem.svg)](https://travis-ci.org/ryanuber/strategy-gem) [![Code Climate](https://codeclimate.com/github/ryanuber/strategy-gem/badges/gpa.svg)](https://codeclimate.com/github/ryanuber/strategy-gem) [![Gem Version](https://badge.fury.io/rb/strategy.svg)](http://badge.fury.io/rb/strategy)

`strategy` is a ruby gem which helps you encapsulate entire workflows. It is
intended to help with building CLI interfaces which perform complex, stepped
workflows and visualize them before executing on them.

Following is a basic example of how `strategy` can help you build CLI's.

```ruby
require 'strategy'

# Create a new plan and give it a name.
plan = Strategy.plan "Hokey Pokey"

# Create a new step and assign one action to it
step = Strategy.step "Put your right foot in"
step.action { puts "*puts right foot in*" }

# Add the created step to the execution plan
plan.add step

# Add a second step to the plan
step = Strategy.step "Take your right foot out"
step.action { puts "*takes right foot out*" }
plan.add step

# Add a third step. This step contains multiple actions. Technically, since we
# are dealing with ruby blocks, a single action could contain any amount of
# ruby code. This step demonstrates that a step can be added to more than once.
step = Strategy.step "Put your right foot in and shake it all about"
step.action { puts "*puts right foot in*" }
step.action { puts "*shakes it all about*" }
plan.add step

# Dump a text representation of the execution plan, allowing us to see what is
# going to happen before we execute it.
puts plan.describe

puts "\n<Enter> to execute"
gets

# Execute the plan
plan.execute!

puts "\n<Enter> to execute"
gets

# Plan execution can also accept a ruby block. For each step in the plan, just
# before the step is exeucted, the plan will yield the step number and the
# description to allow printing execution markers and whatnot.
plan.execute! { |num, desc| puts "\n==> Executing step #{num}: #{desc}" }
```

Output:

```
$ ruby test.rb
Hokey Pokey
  1. Put your right foot in
  2. Take your right foot out
  3. Put your right foot in and shake it all about

<Enter> to execute

*puts right foot in*
*takes right foot out*
*puts right foot in*
*shakes it all about*

<Enter> to execute


==> Executing step 1: Put your right foot in
*puts right foot in*

==> Executing step 2: Take your right foot out
*takes right foot out*

==> Executing step 3: Put your right foot in and shake it all about
*puts right foot in*
*shakes it all about*
```
