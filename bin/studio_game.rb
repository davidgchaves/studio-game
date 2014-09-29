require_relative '../lib/studio_game/game'
require_relative '../lib/studio_game/clumpsy_player'
require_relative '../lib/studio_game/berserk_player'

knuckleheads = StudioGame::Game.new "Knuckleheads"
default_player_file = File.join File.dirname(__FILE__), 'players.csv'
knuckleheads.load_players ARGV.shift || default_player_file

clumpsy_player = StudioGame::ClumpsyPlayer.new "klumpz", 105
knuckleheads.add_player clumpsy_player

berserk_player = StudioGame::BerserkPlayer.new "berserker", 50
knuckleheads.add_player berserk_player

loop do
  puts "\nHow many game rounds? ('quit' to exit)"
  answer = gets.chomp.downcase
  case answer
  when /^\d+$/
    knuckleheads.play answer.to_i
  when "quit" || "exit"
    knuckleheads.print_game_stats
    break
  else
    puts "Please enter a number or 'quit'"
  end
end

knuckleheads.save_high_scores
