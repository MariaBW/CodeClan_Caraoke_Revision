require('minitest/autorun')
require('minitest/rg')
require_relative('../song.rb')


class TestSong < MiniTest::Test

  def setup
    @song = Song.new("Marriage of Figaro", "Mozart")
  end

  def test_song_has_title
    assert_equal("Marriage of Figaro", @song.title)
  end

  def test_song_has_artist
    assert_equal("Mozart", @song.artist)
  end


end
