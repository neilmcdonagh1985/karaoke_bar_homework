require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../songs')

class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new(25)
    @song1 = Song.new('New Order', 'Blue Monday')
    @song2 = Song.new('Blur', 'Song 2')
  end

  def test_capacity_of_room
    assert_equal(25, @room1.capacity)
  end

  def test_playlist_exists
    assert_equal([], @room1.playlist)
  end

  def test_add_song_to_playist
    @room1.add_song(@song1)
    @room1.add_song(@song2)
    assert_equal(2, @room1.playlist.count)
  end



end
