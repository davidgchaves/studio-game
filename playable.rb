module Playable
  # NOTE: I wonder if the blam and w00t methods
  #       shouldn't be the perfect candidates for a Writer Monad.
  #       Obviously there's the issue with the self.health mutation,
  #       ...but the logging part...
  # NOTE TO SELF: STOP LEARNING HASKELL, I see Monads everywhere!!!!
  def blam
    self.health -= 10
    puts "#{self.name} got blammed!"
  end

  def w00t
    self.health += 15
    puts "#{self.name} got w00ted!"
  end

  def strong?
    self.health > 100
  end
end
