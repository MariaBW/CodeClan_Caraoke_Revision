class Room
  attr_reader :name, :capacity, :entry_fee, :guest_list, :play_list

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @guest_list = []
    @play_list = []

  end

  #the first guest entering the room should pay the fee, the others do not pay

  #if room full refuse entry
  #if room empty and guest cash >= entry fee, charge fee then check in guest
  #if room empty and guest cash < entry fee refuse entry
  #if room not empty, check in guest

  def room_empty
    @guest_list.length == 0
  end

  def room_full
    @guest_list.length >= capacity
  end

  def check_in(guest)
    # room_full ? "Sorry this room is full" : @guest_list.push(guest)
    if room_full
      "Sorry this room is full"
    elsif room_empty
      guest.can_afford(@entry_fee) ? @guest_list.push(guest) && guest.pay_fee(@entry_fee) : "Sorry, you must pay the entry fee"
    else
      @guest_list.push(guest)
    end

  end

  def check_out(guest)
    @guest_list.delete(guest)
  end

  def add_song(song)
    @play_list.push(song)
  end







end
