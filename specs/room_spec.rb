require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')


class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new("Classical", 8, 25)
    @guest1 = Guest.new("Lottie", 50)
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






end
