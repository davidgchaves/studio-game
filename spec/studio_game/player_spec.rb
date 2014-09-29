require_relative '../../lib/studio_game/player'

module StudioGame
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
      @player.found_treasure Treasure.new(:hammer, 50)
      @player.found_treasure Treasure.new(:hammer, 50)

      expect(@player.to_s).to eq "I'm Larry with health = 150, points = 100 and score = 250."
    end

    it "computes a score as the sum of its health and points" do
      @player.found_treasure Treasure.new(:hammer, 50)
      @player.found_treasure Treasure.new(:hammer, 50)

      expect(@player.score).to eq initial_health + 50 + 50
    end

    it "yields each found treasure and its total points" do
      @player.found_treasure Treasure.new(:skillet, 100)
      @player.found_treasure Treasure.new(:skillet, 100)
      @player.found_treasure Treasure.new(:hammer, 50)
      @player.found_treasure Treasure.new(:bottle, 5)
      @player.found_treasure Treasure.new(:bottle, 5)
      @player.found_treasure Treasure.new(:bottle, 5)
      @player.found_treasure Treasure.new(:bottle, 5)
      @player.found_treasure Treasure.new(:bottle, 5)

      yielded = []
      @player.each_found_treasure { |treasure| yielded << treasure }

      expect(yielded).to eq [
        Treasure.new(:skillet, 200),
        Treasure.new(:hammer, 50),
        Treasure.new(:bottle, 25)
      ]
    end

    it "can be created from a CSV line" do
      player = Player.from_csv "larry,200"

      expect(player.name).to eq "Larry"
      expect(player.health).to eq 200
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

    context "in a collection of players" do
      before do
        @player1 = Player.new 'moe', 100
        @player2 = Player.new 'larry', 200
        @player3 = Player.new 'curly', 300

        @players = [@player1, @player2, @player3]
      end

      it "is sorted by decreasing score by default" do
        expect(@players.sort).to eq [@player3, @player2, @player1]
      end
    end

    context "when computing treasure points" do
      it "stars with 0" do
        expect(@player.points).to eq 0
      end

      it "adds the collected treasures" do
        @player.found_treasure Treasure.new(:hammer, 50)
        @player.found_treasure Treasure.new(:crowbar, 400)
        @player.found_treasure Treasure.new(:hammer, 50)

        expect(@player.points).to eq 50 + 400 + 50
      end
    end
  end
end
