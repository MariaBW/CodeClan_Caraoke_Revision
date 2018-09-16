require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new("Classical", 8, 25)
    @room2 = Room.new("Small", 2, 10)
    @guest1 = Guest.new("Lottie", 50)
    @guest2 = Guest.new("Bella", 40)
    @song1 = Song.new("Marriage of Figaro", "Mozart")
  end

  def test_room_has_name
    assert_equal("Classical", @room1.name())
  end

  def test_room_has_capacity
    assert_equal(8, @room1.capacity())
  end

  def test_room_has_entry_fee
    assert_equal(25, @room1.entry_fee())
  end

  def test_guest_is_checked_in
    @room1.check_in(@guest1)
    assert_equal(1, @room1.guest_list.length())
  end

  def test_guest_is_checked_out
    @room1.check_in(@guest1)
    @room1.check_out(@guest1)
    assert_equal(0, @room1.guest_list.length())
  end

  def test_add_song
    @room1.add_song(@song1)
    assert_equal(1, @room1.play_list.length())
  end

  def test_room_is_full
    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    assert_equal(true, @room2.room_full())

  end

  def test_cannot_check_in_room_full
    @room2.check_in(@guest1)
    @room2.check_in(@guest2)
    @guest3 = Guest.new("Susie", 30)
    result = @room2.check_in(@guest3)
    assert_equal("Sorry this room is full", result)

  end

  def test_room_is_empty
    result = @room1.room_empty()
    assert_equal(true, result)
  end

  def test_first_guest_pays_fee
    @room1.check_in(@guest1)
    assert_equal(25, @guest1.cash)
  end

  def test_subsequent_guest_does_not_pay_fee
    @room1.check_in(@guest1)
    @room1.check_in(@guest2)
    assert_equal(40, @guest2.cash)
  end

  def test_guest_cannot_afford_fee
    @guest4 = Guest.new("Katie", 10)
    result = @room1.check_in(@guest4)
    assert_equal("Sorry, you must pay the entry fee", result)
  end








end
