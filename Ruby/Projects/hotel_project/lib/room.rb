# frozen_string_literal: true

class Room
  def initialize(number)
    @capacity = number
    @occupants = []
  end

  def capacity
    @capacity
  end

  def occupants
    @occupants
  end

  def full?
    @capacity <= @occupants.length
  end

  def available_space
    @capacity - @occupants.length
  end

  def add_occupant(person)
    if self.full?
      return false
    else
      @occupants << person
      return true
    end
  end
end
