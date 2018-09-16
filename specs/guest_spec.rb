require('minitest/autorun')
require('minitest/rg')
require_relative('../guest.rb')


class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new("Lottie", 50)

  end

  def test_guest_has_name
    assert_equal("Lottie", @guest1.name)
  end

  def test_guest_has_cash
    assert_equal(50, @guest1.cash)
  end

end
