require('minitest/autorun')
require('minitest/rg')
require_relative('../karaokebar')
require_relative('../room')

class TestKaraokebar < MiniTest::Test

  def setup
    @karaokebar = Karaoke_bar.new('Lyricz', 5)
    @room1 = Room.new(25)
    @room2 = Room.new(20)
  end

  def test_name_of_karaoke_bar
    assert_equal('Lyricz', @karaokebar.name)
  end

  def test_cost_of_entry_fee
    assert_equal(5, @karaokebar.entry_fee)
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


end
