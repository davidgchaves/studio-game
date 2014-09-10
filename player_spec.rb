require_relative 'player'

describe Player do
  let(:initial_health) { 150 }

  before do
    $stdout = StringIO.new      #supress (redirect) the standard output
    @player = Player.new "larry", initial_health
  end

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

  context "with more than 100 health" do
    it "is strong" do
      expect(@player.strong?).to be true
    end
  end

  context "with 100 or less health" do
    before { @player = Player.new "larry", 100 }

    it "is wimpy" do
      expect(@player.strong?).to be false
    end
  end
end
