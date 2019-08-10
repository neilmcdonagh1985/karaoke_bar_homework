require('minitest/autorun')
require('minitest/rg')
require_relative('../guests')
require_relative('../karaokebar')
require_relative('../room')
require_relative('../songs')
require('pry')

class TestGuest < MiniTest::Test

  def setup
    @guest1 = Guest.new('Brian', 40, 'Song 2')
    @guest2 = Guest.new('Lisa', 20, 'Blue Monday')
    @guest3 = Guest.new('Dave', 4, 'Live Forever')
    @guest4 = Guest.new('Simon', 10, 'Walk Away')
    @karaokebar = Karaoke_bar.new('Lyricz', 5)
    @room1 = Room.new(2)
    @room2 = Room.new(10)
    @song1 = Song.new('New Order', 'Blue Monday')
    @song2 = Song.new('Blur', 'Song 2')
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
    assert_equal("Sorry, we're full!", @guest4.request_entry_to_pub(@karaokebar))
  end

  def test_request_entry_to_particular_room__successful
    @guest1.request_room_entry(@room1)
    assert_equal(1, @room1.people_in_room.count)
  end

  def test_request_entry_to_particular_room_unsuccessful
    @guest1.request_room_entry(@room1)
    @guest2.request_room_entry(@room1)
    assert_equal("Sorry, this room is full!", @guest4.request_room_entry(@room1))
  end

  def test_current_room
    assert_equal("You are in the main hallway", @guest1.current_room)
  end

  def test_update_current_room
    assert_equal(@guest2.update_current_room(@room1), @guest2.current_room)
  end

  def test_pay_entry_fee__can_afford
    assert_equal(35, @guest1.pay_entry_fee(@karaokebar))
  end

  def test_leave_room
    @guest1.request_room_entry(@room1)
    @guest4.request_room_entry(@room1)
    @guest1.leave_room(@room1)
    assert_equal(1, @room1.people_in_room.count)
  end

  def test_request_song
    @guest1.request_room_entry(@room1)
    assert_equal('You have requested Song 2 by Blur', @guest1.request_song(@song2))
  end

  def test_cheer_favourite_song
    @guest1.request_room_entry(@room1)
    @guest1.request_song(@song2)
    assert_equal("Whoo!", @guest1.cheer_fav_song)
  end




end
