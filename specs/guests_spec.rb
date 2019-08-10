require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')
require_relative('../karaokebar')
require_relative('../room')
require('pry')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new('Brian', 40, 'Song 2')
    @guest2 = Guest.new('Lisa', 20, 'Blue Monday')
    @guest3 = Guest.new('Dave', 10, 'Live Forever')
    @karaokebar = Karaoke_bar.new('Lyricz', 5)
    @room1 = Room.new(2)
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

  def test_request_entry_to_pub__successful
    @guest1.request_entry_to_pub(@karaokebar)
    assert_equal(1, @karaokebar.people_in_pub)
  end

  def test_request_entry_to_pub__unsuccessful
    @guest1.request_entry_to_pub(@karaokebar)
    @guest2.request_entry_to_pub(@karaokebar)
    assert_equal("Sorry, we're full!", @guest3.request_entry_to_pub(@karaokebar))
  end

  def test_request_entry_to_particular_room__successful
    @guest1.request_room_entry(@room1)
    assert_equal(1, @room1.people_in_room)
  end

  def test_request_entry_to_particular_room_unsuccessful
    @guest1.request_room_entry(@room1)
    @guest2.request_room_entry(@room1)
    assert_equal("Sorry, this room is full!", @guest3.request_room_entry(@room1))
  end




end
