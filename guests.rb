class Guest

  attr_reader :name, :wallet, :fav_song, :current_room

  def initialize(name, spending_money, fav_song)
    @name = name
    @wallet = spending_money
    @fav_song = fav_song
    @current_room = "You are in the main hallway"
  end

  def request_entry_to_pub(pub)
    pub.allow_entry_to_pub(self)
  end

  def request_room_entry(room)
    room.allow_entry_to_room(self)
    # if guest is in room with a playlist which has his/her fav song, they cheer
  end

  def update_current_room(room)
    @current_room = room
  end

  def pay_entry_fee(pub)
    @wallet -= pub.entry_fee
  end

  def leave_room(room)
    room.people_in_room.delete(self)
  end

  def request_song(song)
    @current_room.playlist << song
    return "You have requested #{song.title} by #{song.artist}"
  end

  def cheer_fav_song
    for song in @current_room.playlist
      if fav_song == song.title
        return "Whoo!"
      end
    end
    return nil
  end


  end

  # def cheer_fav_song
  #   if @current_room.playlist.include?(@fav_song)
  #   return "Whoo!"
  # end
  # end
