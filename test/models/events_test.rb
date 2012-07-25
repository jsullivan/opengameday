require "minitest_helper"

  describe Event do
    it "requires bgg_id to be valid" do
      event = Event.new
      refute event.valid?
      assert event.errors[:bgg_id]
    end

end
