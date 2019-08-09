require('minitest/autorun')
require('minitest/rg')
require_relative('../songs')

class TestSong < MiniTest::Test

def setup
  @song1 = Song.new('New Order', 'Blue Monday')
end

def test_check_name_of_artist
  assert_equal('New Order', @song1.artist)
end

def test_check_title_of_song
  assert_equal('Blue Monday', @song1.title)
end



end
