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

  def test_guest_pays_fee
    @guest1.pay_fee(30)
    assert_equal(20, @guest1.cash)
  end

  def test_guest_can_afford
    result = @guest1.can_afford(40)
    assert_equal(true, result)
  end

end
