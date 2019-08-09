class Karaoke_bar

  attr_reader :name, :entry_fee, :rooms, :money_in_till

  def initialize(name, entry_fee)
    @name = name
    @entry_fee = entry_fee
    @rooms = []
    @money_in_till = 0
  end

  def add_room(room)
    @rooms << room
  end

end
