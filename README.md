Soroban
=======

Soroban is a calculating engine that understands Excel formulas.

About this Fork
--------------

https://github.com/coezbek/soroban/ was forked from agworld/soroban, because the original repo was switched to read-only and soroban crashed for me when using absolute references containing absolute references such as `A$1`. I also updated `rubyXL` to a recent 3.4.

How to use this gem instead of agworld/soroban
----------------------------------------------

In your Gemfile add:

```ruby
# Gemfile
git_source(:github) { |repo| "https://github.com/#{repo}.git" }
gem 'soroban', github: "coezbek/soroban"
gem 'rubyXL', '~> 3.4.18' # If you want to use the rubyXL import function
```

Getting Started
---------------

Apart from the examples on this page, look at the [tests](https://github.com/agworld/soroban/blob/master/spec/soroban_spec.rb) and the [API docs](http://rubydoc.info/github/agworld/soroban/master/frames) to get up to speed.

Example Usage
-------------

```ruby
s = Soroban::Sheet.new()

s.A1 = 2
s.set('B1:B5' => [1,2,3,4,5])
s.C1 = "=SUM(A1, B1:B5, 5) + A1 ^ 3"
s.C2 = "=IF(C1>30,'Large','Tiny')"

puts s.C1             # => 30

s.bind(:input => :A1, :output => :C2)

puts s.output         # => "Tiny"

s.input = 3

puts s.output         # => "Large"
puts s.C1             # => 50
```

Bindings
--------

Soroban allows you to bind meaningful variable names to individual cells and to ranges of cells. When bound to a range, variables act as an array.

```ruby
s.set(:A1 => 'hello', 'B1:B5' => [1,2,3,4,5])

s.bind(:foo => :A1, :bar => 'B1:B5')

puts s.foo            # => 'hello'
puts s.bar[0]         # => 1

s.bar[0] = 'howdy'

puts s.B1             # => 'howdy'
```

Persistence
-----------

Soroban formulas are strings that begin with the `=` symbol. It is therefore
easy to persist them, which is mighty handy if you need to parse an Excel
spreadsheet, rip out formulas, store everything to a database and then perform
calculations based on user input.

Soroban makes this easy, as it can tell you which cells you need to add to make
it possible to do the calculations you want, and it can iterate over all the
cells you've defined, so you can easily rip them out for persistence.

```ruby
s.F1 = "= E1 + SUM(D1:D5)"

puts s.missing        # => [:E1, :D1, :D2, :D3, :D4, :D5]

s.E1 = "= D1 ^ D2"
s.set("D1:D5" => [1,2,3,4,5])

puts s.missing             # => []

s.cells               # => {:F1=>"= E1 + SUM(D1:D5)", :E1=>"= D1 ^ D2", :D1=>"1", :D2=>"2", :D3=>"3", :D4=>"4", :D5=>"5"}
```

Importers
---------

Soroban has a built-in importer for xlsx files. It requires the [RubyXL](https://github.com/gilt/rubyXL) gem:

```
gem install rubyXL
```

or add the following to your Gemfile:
  
```
# Gemfile
gem 'rubyXL', '~> 3.4.18' # If you want to use the rubyXL import function
```

Use it as follows:

```ruby
require 'rubyXL'
require 'soroban'

# Define which cells contain data for input/output
hash = {
  planet: :B1,
  mass: :B2,
  force: :B3
}

sheet_number = 0
s = Soroban::Import::rubyXL("files/Physics.xlsx", sheet_number, hash)

s.planet = 'Earth'
s.mass = 80
puts s.force          # => 783.459251241996

s.planet = 'Venus'
s.mass = 80
puts s.force          # => 710.044826106394
```

The above example parses the first sheet of Physics.xlsx, which you can [download](https://github.com/coezbek/soroban/raw/master/files/Physics.xlsx).

This import process returns a new Soroban::Sheet object that contains all the
cells required to calculate the values of the bound variables, and which has the
bindings set up correctly.

You can import other kinds of file using the following pattern:

* Add the cells that correspond to bound inputs and outputs
* Add the cells reported by `missing` (and continue to do so until it's empty)
* Persist the hash returned by `cells`

Iteration
---------

Note that `cells` returns the label of the cell along with its raw contents. If
you want to iterate over cell values (including computed values of formulas),
then use `walk`.

```ruby
s.set('D1:D5' => [1,2,3,4,5])
s.walk('D1:D5').reduce(:+)    # => 15
```

Functions
---------

Soroban implements some Excel functions, but you may find that you need more
than those. In that case, it's easy to add more.

```ruby
Soroban::functions            # => ["AND", "AVERAGE", "EXP", "IF", "LN", "MAX", "MIN", "NOT", "OR", "SUM", "VLOOKUP"]

Soroban::define :FOO => lambda { |lo, hi|
  raise ArgumentError if lo > hi
  rand(hi-lo) + lo
}

s.g = "=FOO(10, 20)"

puts s.g              # => 17
```

Contributing to Soroban
-----------------------
 
* Check out the latest master to make sure the feature hasn't been implemented or the bug hasn't been fixed yet.
* Check out the issue tracker to make sure someone already hasn't requested it and/or contributed it.
* Fork the project.
* Start a feature/bugfix branch.
* Commit and push until you are happy with your contribution.
* Make sure to add tests for it. This is important so I don't break it in a future version unintentionally.

Copyright / License
---------

Copyright (c) 2021 C. Özbek
Copyright (c) 2014 Agworld Pty. Ltd. 

Licensed under MIT License / See LICENSE.txt for further details.
