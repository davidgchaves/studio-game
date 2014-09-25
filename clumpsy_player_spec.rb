require_relative 'clumpsy_player'

describe ClumpsyPlayer do
  let(:initial_health) { 100 }
  let(:boost_factor) { 5 }
  before { $stdout = StringIO.new }

  it "gets half the points for each treasure" do
    clumpsy_player = ClumpsyPlayer.new "klutz"
    hammer = Treasure.new :hammer, 50
    crowbar = Treasure.new :crowbar, 400

    3.times { clumpsy_player.found_treasure hammer }
    2.times { clumpsy_player.found_treasure crowbar }

    expect(clumpsy_player.points).to eq (50*3 + 400*2) / 2
  end

  it "has a boost factor" do
    boosted_clumpsy_player = ClumpsyPlayer.new "klutz", initial_health, boost_factor

    expect(boosted_clumpsy_player.boost_factor).to eq 5
  end

  it "gets boost factor number of w00ts" do
    boosted_clumpsy_player = ClumpsyPlayer.new "klutz", initial_health, boost_factor
    boosted_clumpsy_player.w00t

    expect(boosted_clumpsy_player.health).to eq initial_health + (15 * boost_factor)
  end
end
