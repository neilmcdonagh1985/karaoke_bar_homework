require('minitest/autorun')
require('minitest/rg')
require_relative('../room')
require_relative('../songs')

class TestRoom < MiniTest::Test

  def setup
    @room1 = Room.new(25)
    @song1 = Song.new('New Order', 'Blue Monday')
    @song2 = Song.new('Blur', 'Song 2')
    @song3 = Song.new('Radiohead', 'Idioteque')
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

  def test_play_song
    assert_equal('Playing Blue Monday by New Order...', @room1.play_song(@song1))
  end

  # to shuffle playlist and test, could try to create an empty array, selecting random items out of the filled
  # array, then loading them into the empty one, recording which ones have been played. The test could be
  # that all of the items in the original array are now in the new array. when a song is randomly selected out of the
  # original array, the play_song method could then be called on it (and stored in a 'currently playing' variable)
  # before then being pushed into the new array. Could then check through this with pry. the guest could cheer whenever
  # their fav song matches the one in 'currently playing'.



end
