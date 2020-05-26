require_relative "room"

class Hotel

  def initialize(name,capacities)
    @name = name
    @rooms = {}

    capacities.each do |room_name, capacity|
      @rooms[room_name] = Room.new(capacity)
    end
  end

  def name
    @name.split.map(&:capitalize).join(' ')
  end

  def rooms
    @rooms
  end

  def room_exists?(room_name)
    @rooms.include?(room_name)
  end

  def check_in(person,room_name)
    if self.room_exists?(room_name)
      check = @rooms[room_name].add_occupant(person)

      if check == true
        print 'check is successful'
      else
        print 'sorry, room is full'
      end
    end

    print 'false'
    print 'sorry, room does no exist'
    return
  end

  def has_vacancy?
    @rooms.each do |name,room|
      if room.full?
         return false
      end
      return true
    end
  end

  def list_rooms
    @rooms.each do |name ,room|
    puts "#{name} : #{room.available_space}"
    end
  end
end
