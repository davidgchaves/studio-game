require_relative '../../lib/studio_game/berserk_player'

module StudioGame
  describe BerserkPlayer do
    let!(:initial_health) { 50 }
    before do
      $stdout = StringIO.new
      @berserk_player = BerserkPlayer.new "klutz", initial_health
    end

    it "goes berserk when w00ted more than 5 times" do
      6.times { @berserk_player.w00t }

      expect(@berserk_player.berserk?).to be_truthy
    end

    context "when it's gone berserk" do
      before { 6.times { @berserk_player.w00t } }

      it "gets w00ted instead of blammed" do
        3.times { @berserk_player.blam }

        expect(@berserk_player.health).to eq initial_health + (9*15)
      end
    end
  end
end
