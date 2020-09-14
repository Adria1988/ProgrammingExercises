require_relative 'board'
require_relative 'human_player'


def v3(size, players)
  i = 0
  @players = []
  #@players = marks.map { |mark| HumanPlayer.new(mark,i) +=1 }
  @marks = players.map { |key,value|  value ? 'its cmputer' : 'its human'}
  p @marks
  @current_player = @players.first
  @board = Board.new(size)
end

def switch_turn
  @players.rotate!
  @current_player = @players.first
end

def play
  while @board.empty_positions?
    @board.print
    pos = @current_player.get_position
    @board.place_mark(pos, @current_player.mark)
    if @board.win?(@current_player.mark)
      print 'GAME OVER'
      puts '----'
      print "Congratulations player #{@current_player.player} YOU WIN!! "
      puts '----'
      @board.print
      return
    else
      self.switch_turn
    end
  end

  print 'GAME OVER!'
end

v3(4, {X: false, Y:true, Z: false } )