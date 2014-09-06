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


player1 = Player.new "moe"
player2 = Player.new "larry", 60
player3 = Player.new "curly", 125

players = [player1, player2, player3]
players.pop
players.push Player.new("Shremp", 90)

puts "There are #{players.length} players in the game:"
players.each { |player| puts player }

players.each do |player|
  puts player.health
end

players.each do |player|
  player.blam
  2.times { player.w00t }
  puts player
end
