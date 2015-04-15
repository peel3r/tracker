require "test_helper"

class SubmissionTest < ActiveSupport::TestCase

  def submission
    @submission ||= Submission.new
  end

  def test_valid
    assert submission.valid?
  end

end
