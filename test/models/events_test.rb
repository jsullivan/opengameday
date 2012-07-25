require "minitest_helper"

  describe Event do
    it "requires a game_title to be valid" do
      event = Event.new
      refute event.valid?
      assert event.errors[:game_title]
    end

end
