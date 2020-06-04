# frozen_string_literal: true

class Player
  def get_move
    print 'enter a position with coordinates separated with a space like `4 7`'
    pos = gets.chomp
    #gets.chomp.split(" ").map(&:to_i)
    pos.delete(' ').chars.map(&:to_i)
  end
end
