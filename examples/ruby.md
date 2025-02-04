## Ruby Code Example

```ruby
#!/usr/bin/env ruby

# Frozen string literal comment (Ruby 3.0+)
# frozen_string_literal: true

# Module definition with mixin functionality
module Greetable
  def greet
    "Hello, #{@name}!"
  end
end

# Class definition with inheritance
class Animal
  attr_accessor :name  # Attribute accessor

  # Class variable
  @@count = 0

  # Constructor
  def initialize(name)
    @name = name       # Instance variable
    @@count += 1
  end

  # Class method
  def self.count
    @@count
  end

  # Instance method
  def speak
    raise NotImplementedError, "Subclass must implement abstract method"
  end
end

# Inheritance and module inclusion
class Dog < Animal
  include Greetable

  # Constant definition
  SPECIES = "Canis lupus familiaris"

  def speak
    "Woof!"
  end

  # Method with default parameter
  def play(toy = "ball")
    "Playing with #{toy}"
  end
end

# Exception handling
begin
  # Create objects
  dog = Dog.new("Rex")

  # String interpolation
  puts "Created a dog named #{dog.name}"

  # Method calls
  puts dog.greet
  puts dog.speak
  puts dog.play

  # Array operations
  animals = %w[dog cat bird]  # Array literal
  animals.map!(&:upcase)      # Symbol to proc
  animals.each { |a| puts a } # Block syntax

  # Hash with symbol keys
  pet_ages = {
    rex: 3,
    fluffy: 4,
    spot: 2
  }

  # Hash iteration
  pet_ages.each do |name, age|
    puts "#{name} is #{age} years old"
  end

  # Range and case statement
  age = 25
  case age
  when 0..12
    puts "Child"
  when 13..19
    puts "Teenager"
  else
    puts "Adult"
  end

  # Lambda definition
  greeter = ->(name) { "Hello, #{name}!" }
  puts greeter.call("World")

  # Proc definition
  multiplier = proc { |x| x * 2 }
  puts [1, 2, 3].map(&multiplier)

  # Conditional expressions
  puts "It's sunny!" if Time.now.hour > 6

  # Unless statement
  puts "Good night!" unless Time.now.hour < 20

  # Ternary operator
  status = dog.name.empty? ? "Anonymous" : dog.name

  # Method with keyword arguments
  def configure(host: "localhost", port: 8080)
    "Configured with #{host}:#{port}"
  end

  # Splat operator for arrays
  def sum(*numbers)
    numbers.reduce(0, :+)
  end

  puts sum(1, 2, 3, 4, 5)

  # Double splat operator for hashes
  def settings(**options)
    options
  end

  # Parallel assignment
  a, b = 1, 2

  # Safe navigation operator
  user = nil
  puts user&.name

  # Here document
  message = <<~HEREDOC
    This is a multi-line
    string using HEREDOC
    syntax
  HEREDOC

rescue StandardError => e
  puts "Error: #{e.message}"
ensure
  puts "Execution completed"
end

# Freeze object
CONSTANTS = %w[ONE TWO THREE].freeze

# Method access control
class Example
  def public_method
    "Public"
  end

  private

  def private_method
    "Private"
  end

  protected

  def protected_method
    "Protected"
  end
end
```
