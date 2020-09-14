require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'


class Game

  def initialize(size,players)
    i = 0
    @players = []
    #@players = marks.map { |mark| HumanPlayer.new(mark,i) +=1 }
    players.each do |mark, is_computer|
      @players << if is_computer
                    ComputerPlayer.new(mark,i)
                  else
                    HumanPlayer.new(mark,i)
                  end
      i += 1
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
      puts '----'
      @board.print
      puts '----'
      pos = @current_player.get_position(@board.legal_positions)
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

    print 'Empate,GAME OVER!'
  end
end