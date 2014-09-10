class Player
  attr_reader :health, :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def score
    @health + @name.length
  end

  def strong?
    @health > 100
  end

  # NOTE: I wonder if the blam and w00t methods
  #       shouldn't be the perfect candidates for a Writer Monad.
  #       Obviously there's the issue with the @health mutation,
  #       ...but the logging part...
  # NOTE TO SELF: STOP LEARNING HASKELL, I see Monads everywhere!!!!
  def blam
    @health -= 10
    puts "#{@name} got blammed!"
  end

  def w00t
    @health += 15
    puts "#{@name} got w00ted!"
  end

  def to_s
    "I'm #{@name} with a health of #{@health} and a score of #{score}."
  end
end
