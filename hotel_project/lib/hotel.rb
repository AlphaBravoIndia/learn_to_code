require_relative "room"

class Hotel
  def initialize(name, rooms)
    @name = name
    @rooms = {}
    rooms.each { |room, capacity| @rooms[room] = Room.new(capacity) }
  end

  def name
    @name.split(" ").map(&:capitalize).join(" ")
  end

  def rooms
    @rooms
  end

  def room_exists?(room)
    @rooms.has_key?(room)
  end

  def check_in(person, room)
    if self.room_exists?(room)
      if @rooms[room].add_occupant(person)
        puts "check in successful"
      else
        puts "sorry, room is full"
      end
    else
      puts "sorry, room does not exist"
    end
  end

  def has_vacancy?
    @rooms.each_value.any? { |room| !room.full? }
  end

  def list_rooms
    @rooms.each { |name, room| puts "#{name}.*#{room.available_space}" }
  end
end
