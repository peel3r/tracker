require "test_helper"

class PoolTest < ActiveSupport::TestCase

  def pool
    @pool ||= Pool.new
  end

  def test_valid
    assert pool.valid?
  end

end
