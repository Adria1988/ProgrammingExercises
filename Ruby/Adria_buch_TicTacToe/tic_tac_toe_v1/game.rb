require_relative 'board'
require_relative 'human_player'

class Game

  def initialize(player_1_mark,player_2_mark)
    @player_1 = HumanPlayer.new(player_1_mark)
    @player_2 = HumanPlayer.new(player_2_mark)
    @current_player = @player_1
    @board = Board.new
  end

  def switch_turn
    @current_player = if @current_player == @player_1
      @player_2
    else
      @player_1
                      end
  end

  def play
    while @board.empty_positions?
      @board.print
      pos = @current_player.get_position
      @board.place_mark(pos,@current_player.mark)
      if @board.win?(@current_player.mark)
        print 'GAME OVER'
        print "Congratulations #{@current_player} YOU WIN!! "
        return
      else
        self.switch_turn
      end
    end

    print 'GAME OVER!'
  end
end