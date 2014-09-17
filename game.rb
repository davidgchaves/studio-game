require_relative 'game_turn'
require_relative 'treasure_trove'

class Game
  attr_reader :title

  def initialize(title)
    @title = title
    @players = []
  end

  def add_player(player)
    @players.push player
  end

  def play(rounds)
    puts "There are #{@players.length} players in #{@title}:"

    @players.each { |player| puts player }

    treasures = TreasureTrove::TREASURES
    puts "\nThere are #{treasures.size} treasures to be found:"
    treasures.each { |t| puts "A #{t.name} is worth #{t.points} points" }

    1.upto(rounds) do |round|
      puts "\nRound: #{round}"
      @players.each do |player|
        GameTurn.take_turn player
      end
    end
  end

  def print_game_stats
    puts "\n#{@title} Statistics:"

    strong_players, wimpy_players = @players.partition &:strong?

    puts "\n#{strong_players.length} strong players:"
    strong_players.each &:print_name_and_health

    puts "\n#{wimpy_players.length} wimpy players:"
    wimpy_players.each &:print_name_and_health

    puts "\n#{@title} High Scores:"
    @players.sort.each &:pretty_print_name_and_score
  end
end
