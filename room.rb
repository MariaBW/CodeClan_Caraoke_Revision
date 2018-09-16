class Room
  attr_reader :name, :capacity, :entry_fee, :guest_list, :play_list

  def initialize(name, capacity, entry_fee)
    @name = name
    @capacity = capacity
    @entry_fee = entry_fee
    @guest_list = []
    @play_list = []

  end

  def check_in(guest)
    @guest_list.push(guest)
  end

  def check_out(guest)
    @guest_list.delete(guest)
  end

  def add_song(song)
    @play_list.push(song)
  end







end