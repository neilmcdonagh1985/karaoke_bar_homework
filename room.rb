class Room

  attr_reader :capacity, :playlist, :people_in_room

  def initialize(capacity)
    @capacity = capacity
    @playlist = []
    @people_in_room = 0
    # @song_currently_playing = @playlist.pop
  end

  def add_song(song)
    @playlist << song
  end

  def play_song(song)
    "Playing #{song.title} by #{song.artist}..."
  end

  def allow_entry_to_room(guest)
    if @people_in_room < @capacity
      @people_in_room += 1
    else
      return "Sorry, this room is full!"
    end
  end


end
