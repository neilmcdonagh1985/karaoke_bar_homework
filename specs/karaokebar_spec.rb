require('minitest/autorun')
require('minitest/rg')
require_relative('../karaokebar')
require_relative('../room')
require_relative('../guests')
require('pry')

class TestKaraokebar < MiniTest::Test

  def setup
    @karaokebar = Karaoke_bar.new('Lyricz', 5)
    @room1 = Room.new(25)
    @room2 = Room.new(20)
    @guest1 = Guest.new('Brian', 40, 'Song 2')
    @guest2 = Guest.new('Lisa', 20, 'Blue Monday')
    @guest3 = Guest.new('Dave', 4, 'Live Forever')
    @guest4 = Guest.new('Simon', 10, 'Walk Away')
  end

  def test_name_of_karaoke_bar
    assert_equal('Lyricz', @karaokebar.name)
  end

  def test_cost_of_entry_fee
    assert_equal(5, @karaokebar.entry_fee)
  end

  def test_total_number_of_people_in_pub
    assert_equal(0, @karaokebar.people_in_pub)
  end

  def test_total_capacity
    assert_equal(2, @karaokebar.total_capacity)
  end

  def test_rooms_array_exists
    assert_equal([], @karaokebar.rooms)
  end

  def test_amount_of_money_in_till
    assert_equal(0, @karaokebar.money_in_till)
  end

  def test_add_room
    @karaokebar.add_room(@room1)
    @karaokebar.add_room(@room2)
    assert_equal(2, @karaokebar.rooms.count)
  end

  def test_allow_entry_to_pub__yes
    @karaokebar.allow_entry_to_pub(@guest1)
    assert_equal(1, @karaokebar.people_in_pub)
  end

  def test_allow_entry_to_pub__no
    @karaokebar.allow_entry_to_pub(@guest1)
    @karaokebar.allow_entry_to_pub(@guest2)
    assert_equal("Sorry, we're full!", @karaokebar.allow_entry_to_pub(@guest4))
  end

  def test_customer_cannot_afford_entry
    assert_equal("No' the night, pal.", @karaokebar.allow_entry_to_pub(@guest3))
  end


end
