class Karaoke_bar

  attr_reader :name, :entry_fee, :rooms, :money_in_till, :people_in_pub, :total_capacity

  def initialize(name, entry_fee)
    @name = name
    @entry_fee = entry_fee
    @rooms = []
    @money_in_till = 0
    @people_in_pub = 0
    @total_capacity = 2

  end

  def add_room(room)
    @rooms << room
  end

def allow_entry_to_pub(guest)
  if guest.wallet < self.entry_fee
    return "No' the night, pal."
  elsif @people_in_pub < @total_capacity
    @people_in_pub += 1
  else
    return "Sorry, we're full!"
  end
end

end
