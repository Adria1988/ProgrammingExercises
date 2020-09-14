@grid = Array.new(4) { Array.new(4, '_') }

def place_mark(position, mark)
  pos1 = position[0]
  pos2 = position[1]


  if !valid?(pos1, pos2) || !empty?(pos1, pos2)
    raise RangeError, 'this should fail RuntimeError: invalid Mark'
  end
  @grid[pos1][pos2] = mark

end

def valid?(pos1, pos2)
  if pos1 < 0 || pos2 < 0 || pos1 > @grid.length || pos2 > @grid.length
    return false
  end
  true
end

def empty?(pos1, pos2)
  @grid[pos1][pos2] == '_'
end

def legal_positions
  legal_positions = []
  (0...@grid.length).each do |row|
    (0...@grid.length).each do |col|
      if valid?(row,col) && empty?(row,col)
        legal_positions << [row,col]
      end
    end
  end

  legal_positions

end

def print
  @grid.each do |arr|
    p arr.join(" ")
  end
end

def win_row?(mark)
  @grid.each do |row|
    return true if row.all? { |ele| ele == mark }
  end
  false
end

def win_col?(mark)
  @grid.transpose.each do |row|
    return true if row.all? { |ele| ele == mark }
  end
  false
end

/(0...@grid.length - 1).each do |row|
  (0...@grid.length).each do |col|
    before_position = @grid[row - 1][col]
    next_position = @grid[row + 1][col]
    if @grid[row][col] == mark && before_position == mark && next_position == mark
      return true
    end
  end
end/

def win_diagonal?(mark)

  arr_left_right = []
  arr_right_left = []
  #diagonanl left right
  (0...@grid.length).each do |i|
    if @grid[i][i] == mark
      arr_left_right << @grid[i][i]
    end
  end

  #diagonal right left
  i = @grid.length - 1
  y = 0
  while i >= 0
    if @grid[y][i] == mark
      arr_right_left << @grid[i][i]
    end
    i -= 1
    y += 1
  end

  if arr_right_left.length == @grid.length || arr_left_right.length == @grid.length
    return true
  end

  false
end

def win?(mark)
  return true if win_row?(mark) || win_col?(mark) || win_diagonal?(mark)

  false
end

def empty_positions?
  (0...@grid.length).each do |row|
    (0...@grid.length).each do |col|
      return true if empty?(row,col)
    end
  end
  false
end
p legal_positions

/place_mark([0, 0], :X)
place_mark([0, 1], :O)
place_mark([0, 2], :X)
place_mark([0, 4], :X)
place_mark([1, 0], :X)
place_mark([1, 1], :X)
place_mark([1, 2], :O)
place_mark([1, 3], :X)
place_mark([2, 0], :O)
place_mark([2, 1], :O)
place_mark([2, 2], :X)
place_mark([3, 0], :O)
place_mark([3, 3], :X)
place_mark([3, 1], :X)
place_mark([4, 4], :X)
place_mark([4, 0], :O)
place_mark([5, 0], :O)
place_mark([5, 5], :X)
place_mark([6, 0], :O)
place_mark([6, 6], :X)
place_mark([7, 0], :O)
place_mark([7, 7], :X)
place_mark([8, 0], :O)
place_mark([8, 8], :X)
place_mark([9, 0], :O)
place_mark([9, 9], :X)




p valid?(0,0)
p valid?(-1,0)
p valid?(12,0)
p valid?(9,0)



p print
p 'win?'
p win?(:X)
p 'win row'
p win_row?(:O)
p 'win col'
p win_col?(:O)
p 'win diagonal'
p win_diagonal?(:X)
p 'empty positions'
p empty_positions?
/

