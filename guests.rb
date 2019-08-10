class Guest

  attr_reader :name, :wallet, :fav_song

  def initialize(name, spending_money, fav_song)
    @name = name
    @wallet = spending_money
    @fav_song = fav_song
  end

  def request_entry_to_pub(pub)
    pub.allow_entry_to_pub(self)
  end

  def request_room_entry(room)
    room.allow_entry_to_room(self)
  end

  def pay_entry_fee(pub)
    @wallet -= pub.entry_fee
  end

  def leave_room(room)
    room.people_in_room.delete(self)
  end



end
