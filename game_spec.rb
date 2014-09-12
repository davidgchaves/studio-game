require_relative 'game'
require_relative 'player'

describe Game do
  let(:initial_health) { 100 }

  before do
    $stdout = StringIO.new      #supress (redirect) the standard output
    @game = Game.new "Knuckleheads"
    @player = Player.new "moe", initial_health
    @game.add_player @player
  end

  it "w00ts the player if a high number is rolled" do
    allow(Die).to receive(:roll) { 5 }

    @game.play

    expect(@player.health).to eq initial_health + 15
  end

  it "skips the player if a medium number is rolled" do
    allow(Die).to receive(:roll) { 3 }

    @game.play

    expect(@player.health).to eq initial_health
  end

  it "blams the player if a low number is rolled" do
    allow(Die).to receive(:roll) { 1 }

    @game.play

    expect(@player.health).to eq initial_health - 10
  end
end
