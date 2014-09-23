require_relative 'treasure_trove'

class Player
  attr_reader :health, :name

  def initialize(name, health=100)
    @name = name.capitalize
    @health = health
    @found_treasures = Hash.new 0
  end

  def name=(new_name)
    @name = new_name.capitalize
  end

  def score
    @health + points
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

  def found_treasure(treasure)
    @found_treasures[treasure.name] += treasure.points
    puts "#{@name} found a #{treasure.name} worth #{treasure.points} points."
    puts "#{@name}'s treasures: #{@found_treasures}"
  end

  def each_found_treasure
    @found_treasures.each { |name, points| yield Treasure.new name, points }
  end

  def points
    @found_treasures.values.reduce 0, :+
  end

  def <=>(other_player)
    other_player.score <=> score
  end

  def print_name_and_health
    puts "#{@name} (#{@health})"
  end

  def pretty_print_name_and_score
    "#{@name.ljust 20, '.'} #{score}"
  end

  def self.from_csv(line)
    name, health = line.split ','
    Player.new name, Integer(health)
  end

  def to_s
    "I'm #{@name} with health = #{@health}, points = #{points} and score = #{score}."
  end
end
