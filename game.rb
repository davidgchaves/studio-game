require_relative 'die'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push player
  end

  def play
    puts "There are #{@players.length} players in #{@title}:"

    @players.each { |player| puts player }

    @players.each do |player|
      case Die.roll
      when 1..2
        player.blam
      when 3..4
        puts "#{player.name} was skipped."
      when 5..6
        player.w00t
      end

      puts player
    end
  end
end
