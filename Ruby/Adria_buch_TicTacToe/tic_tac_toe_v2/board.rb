class Board

  def initialize(n)
    @grid = Array.new(n) { Array.new(n,'_') }
  end

  def valid?(pos1, pos2)
    if pos1 < 0 || pos2 < 0 || pos1 > @grid.length || pos2 > @grid.length
      return false
    end
    true
  end

  def empty?(pos1,pos2)
    @grid[pos1][pos2] == '_'
  end

  def place_mark(position, mark)
    pos1 = position[0]
    pos2 = position[1]

    if !valid?(pos1,pos2) || !empty?(pos1,pos2)
      raise RangeError, 'this should fail RuntimeError: invalid Mark'
    end
    @grid[pos1][pos2] = mark

  end

  def print
    @grid.each do |row|
      p row.join(" ")
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
end