# frozen_string_literal: true

require_relative 'board'
require_relative 'player'

class Battleship
  def initialize(length_of_the_board)
    @player = Player.new
    @board = Board.new(length_of_the_board)
    @remaining_misses = @board.size / 2
  end

  attr_reader :board

  attr_reader :player

  def start_game
    @board.place_random_ships
    puts "ships num #{@board.num_ships}"
    @board.print
  end

  def lose?
    if @remaining_misses > 0
      false
    else
      puts 'you lose'
      true
    end
  end

  def win?
    @board.num_ships
    if @board.num_ships == 0
      puts 'you win'
      true
    else
      false
    end
  end

  def game_over?
    if win? == true || lose? == true
      return true
    else 
      return false
    end
  end

  def turn
    if @board.attack(@player.get_move) == false
      puts "remaining misses -> #{@remaining_misses -= 1}"
    end
    @board.print
  end
end
