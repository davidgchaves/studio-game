require_relative 'game'
require_relative 'player'

module StudioGame
  describe Game do
    let(:initial_health) { 100 }

    before do
      $stdout = StringIO.new      #supress (redirect) the standard output
      @game = Game.new "Knuckleheads"
      @moe = Player.new "moe", initial_health
      @larry = Player.new "larry", initial_health
      @game.add_player @moe
    end

    it "w00ts the player if a high number is rolled" do
      allow(Die).to receive(:roll) { 5 }

      @game.play 1

      expect(@moe.health).to eq initial_health + 15
    end

    it "skips the player if a medium number is rolled" do
      allow(Die).to receive(:roll) { 3 }

      @game.play 1

      expect(@moe.health).to eq initial_health
    end

    it "blams the player if a low number is rolled" do
      allow(Die).to receive(:roll) { 1 }

      @game.play 1

      expect(@moe.health).to eq initial_health - 10
    end

    it "plays the expecified rounds" do
      allow(Die).to receive(:roll).exactly(3).times.and_return(6, 5, 6)

      @game.play 3

      expect(@moe.health).to eq initial_health + (15 * 3)
    end

    it "assigns a treasure to a player during its turn" do
      @game.play 1

      expect(@moe.points).not_to eq 0
    end

    it "computes total points as the sum of all player points" do
      @game.add_player @larry

      @moe.found_treasure Treasure.new(:hammer, 50)
      @moe.found_treasure Treasure.new(:hammer, 50)
      @larry.found_treasure Treasure.new(:crowbar, 400)

      expect(@game.total_points).to eq 50 + 50 + 400
    end
  end
end
