class ComputerPlayer

  def initialize(mark,player)
    @mark = mark
    @player = player
  end

  def mark
    @mark
  end

  def player
    @player
  end

  def get_position(legal_positions)
    pos = legal_positions.sample
    print "your mark is #{@mark} and position is #{pos}"
    pos
  end
end