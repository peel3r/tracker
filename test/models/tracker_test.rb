require "test_helper"

class TrackerTest < ActiveSupport::TestCase

  def tracker
    @tracker ||= Tracker.new
  end

  def test_valid
    assert tracker.valid?
  end

end
