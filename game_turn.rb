require_relative 'player'
require_relative 'die'
require_relative 'treasure_trove'

module GameTurn
  def self.take_turn(player)
    case Die.roll
    when 1..2
      player.blam
    when 3..4
      puts "#{player.name} was skipped."
    when 5..6
      player.w00t
    end

    treasure = TreasureTrove.random
    puts "#{player.name} found a #{treasure.name} worth #{treasure.points} points."
  end
end
