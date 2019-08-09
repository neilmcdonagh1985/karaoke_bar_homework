class Room

  attr_reader :capacity, :playlist

  def initialize(capacity)
    @capacity = capacity
    @playlist = []
  end

  def add_song(song)
    @playlist << song
  end


end
