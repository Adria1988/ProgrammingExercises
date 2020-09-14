require_relative 'board'
require_relative 'human_player'

class Game

  def initialize(size,*marks)
    i = 0
    @players = []
    #@players = marks.map { |mark| HumanPlayer.new(mark,i) +=1 }
    marks.each do |mark|
      @players << HumanPlayer.new(mark,i)
      i+=1
    end
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
      @board.place_mark(pos,@current_player.mark)
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
end