require_relative "room"

class Hotel

    attr_reader :rooms

  def initialize(name, rooms)
      @name = name
      @rooms = Hash.new
      rooms.each { |k, v| @rooms[k] = Room.new(v) }
  end

  def name
      @name.split.map!{|name| name.capitalize }.join(" ")
  end

  def room_exists?(room_name)
      @rooms.has_key?(room_name)
  end

  def check_in(guest, room_name)
      if !room_exists?(room_name)
        print 'sorry, room does not exist'
      else
        if @rooms[room_name].add_occupant(guest)
            print 'check in successful'
        else
            print 'sorry, room is full'
        end 
      end 
  end

  def has_vacancy?
      @rooms.any? { |room, capacity| !@rooms[room].full? }
  end

  def list_rooms
      @rooms.each do |room, room_object|
        puts "#{room} + #{room_object.available_space}"
      end 
  end
end
