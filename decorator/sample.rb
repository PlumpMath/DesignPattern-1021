# Decorator Pattern Sample
# Allows to add behavior to objects without affecting other objects of the same class

# The real power of decorators lies in the fact that they can act like the objects they are decorating
# You can wrap decorators with other decorators as long as they share the same interface.
# By creating decorators for our different “extras”, we can create coffees using a combination of decorators and get the total cost of the coffee.

# decorator module
module Decorator
  def initialize(decorated)
    @decorated = decorated
  end
end

# core functional class
class Coffee
  def cost
    100
  end
end

# You can include this into any class you want to act as a decorator.
# You can then use that decorator as if it was the object it is decorating
# By default all messages sent to the decorator are forwarded on to the decorated object.
# You can then decorate the methods you need to extend:

# optional wrapper
class Milk
  include Decorator

  def cost
    @decorated.cost + 10
  end
end

class Whip
  include Decorator

  def cost
    @decorated.cost + 20
  end
end

class Sprinkles
  include Decorator

  def cost
    @decorated.cost + 30
  end
end

puts "Coffee costs " + Coffee.new.cost.to_s
puts "Coffee with Milk costs " + Milk.new(Coffee.new).cost.to_s
puts "Coffee with Milk + Whip + Sprinkes costs " + Whip.new(Sprinkles.new(Milk.new(Coffee.new))).cost.to_s
