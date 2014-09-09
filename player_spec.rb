require_relative 'player'

describe Player do
  let(:initial_health) { 150 }

  before { @player = Player.new "larry", initial_health }

  it "has a capitalized name" do
    expect(@player.name).to eq "Larry"
  end

  it "has an initial health" do
    expect(@player.health).to eq initial_health
  end

  it "has a string representation" do
    expect(@player.to_s).to eq "I'm Larry with a health of 150 and a score of 155."
  end

  it "computes a score based on health and name length" do
    expect(@player.score).to eq initial_health + 5
  end

  context "when w00ted" do
    before { @player.w00t }

    it "increases health" do
      expect(@player.health).to eq initial_health + 15
    end
  end

  context "when blammed" do
    before { @player.blam }

    it "decreases health" do
      expect(@player.health).to eq initial_health - 10
    end
  end
end
