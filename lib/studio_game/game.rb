require 'csv'
require_relative 'game_turn'
require_relative 'treasure_trove'

module StudioGame
  class Game
    attr_reader :title

    def initialize(title)
      @title = title
      @players = []
    end

    def load_players(from_file)
      CSV.foreach(from_file) { |row| add_player Player.new row[0], row[1].to_i }
    end

    def save_high_scores(to_file='high_scores.txt')
      File.open(to_file, "w") do |file|
        file.puts "#{@title} High Scores:"
        @players.sort.each { |p| file.puts p.pretty_print_name_and_score }
      end
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

    def total_points
      @players.reduce(0) { |acc, player| acc + player.points }
    end

    def print_game_stats
      puts "\n#{@title} Statistics:"
      puts "#{total_points} total points from treasures found"

      @players.each do |player|
        puts "\n#{player.name}'s point totals:"
        player.each_found_treasure { |t| puts "#{t.points} total #{t.name} points" }
        puts "#{player.points} grand total points"
      end

      strong_players, wimpy_players = @players.partition &:strong?

      puts "\n#{strong_players.length} strong players:"
      strong_players.each &:print_name_and_health

      puts "\n#{wimpy_players.length} wimpy players:"
      wimpy_players.each &:print_name_and_health

      puts "\n#{@title} High Scores:"
      @players.sort.each { |p| puts p.pretty_print_name_and_score }
    end
  end
end
