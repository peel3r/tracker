require "test_helper"

class PossibleTrackerTest < ActiveSupport::TestCase

  def possible_tracker
    @possible_tracker ||= PossibleTracker.new
  end

  def test_valid
    assert possible_tracker.valid?
  end

end
