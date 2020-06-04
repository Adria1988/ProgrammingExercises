# frozen_string_literal: true

class Board

  attr_reader :size

  def self.print_grid(array)
    array.each do |ele|
      puts ele.join(' ')
    end
  end

  def initialize(number)
    @grid = Array.new(number) { Array.new(number, :N) }
    @size = number * number
  end

  def [](position)
    #row, col = position
    @grid[position[0]][position[1]]
  end

  def []=(pos, ele)
    @grid[pos[0]][pos[1]] = ele
  end

  def num_ships
    @grid.flatten.count { |ele| ele == :S}
  end

  def attack(attack_position)
    if self[attack_position] == :S
      self[attack_position] = :H
      puts 'you sunk my battleship!'
      true
    else
      self[attack_position] = :X
      false
    end
  end

  def place_random_ships
    max_ships = 0.25 * size
    while num_ships < max_ships
      row = rand(0...@grid.length)
      col = rand(0...@grid.length)
      pos = [row, col]
      self[pos] = :S
    end
  end

  def hidden_ships_grid
    # we can use double map on @grid
    hidden_grid = Array.new(@grid.size) { Array.new(@grid.size) }
    @grid.each.with_index do |row, index_row|
      row.each.with_index do |col, index_col|
        hidden_grid[index_row][index_col] = col == :S ? :N : col
      end
    end
    hidden_grid
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(self.hidden_ships_grid)
  end
end
