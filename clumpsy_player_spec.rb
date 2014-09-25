require_relative 'clumpsy_player'

describe ClumpsyPlayer do
  before { $stdout = StringIO.new }

  it "gets half the points for each treasure" do
    clumpsy_player = ClumpsyPlayer.new "klutz"
    hammer = Treasure.new :hammer, 50
    crowbar = Treasure.new :crowbar, 400

    3.times { clumpsy_player.found_treasure hammer }
    2.times { clumpsy_player.found_treasure crowbar }

    expect(clumpsy_player.points).to eq (50*3 + 400*2) / 2
  end
end
