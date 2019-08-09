class Room

  attr_reader :capacity, :playlist

  def initialize(capacity)
    @capacity = capacity
    @playlist = []
    # @song_currently_playing = @playlist.pop
  end

  def add_song(song)
    @playlist << song
  end

  def play_song(song)
    p "Playing #{song.title} by #{song.artist}..."
  end


end
