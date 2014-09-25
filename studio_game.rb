require_relative 'game'
require_relative 'clumpsy_player'
require_relative 'berserk_player'

knuckleheads = Game.new "Knuckleheads"
knuckleheads.load_players ARGV.shift || "players.csv"

clumpsy_player = ClumpsyPlayer.new "klumpz", 105
knuckleheads.add_player clumpsy_player

berserk_player = BerserkPlayer.new "berserker", 50
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
