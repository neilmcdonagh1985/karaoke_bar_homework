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



end
