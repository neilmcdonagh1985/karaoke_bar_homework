require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new('Brian', 40, 'Song 2')
  end

  def test_name
    assert_equal('Brian', @guest1.name)
  end

  def test_how_much_money_guest_has
    assert_equal(40, @guest1.wallet)
  end

  def test_favourite_song
    assert_equal('Song 2', @guest1.fav_song)
  end




end
