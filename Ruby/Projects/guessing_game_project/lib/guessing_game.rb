class GuessingGame

  def initialize(min,max)
    @secret_num = rand(min..max)
    @num_attempts = 0
    @num_errors = 3
    @game_over = false
  end

  def secret_num
    @secret_num
  end

  def num_attempts
    @num_attempts
  end

  def user_lost
    @user_lost
  end

  def game_over?
    @game_over
  end


  def num_errors
    @num_errors
  end

  def check_num(num)
    print @secret_num
    if num == @secret_num
      @game_over = true
    elsif num > @secret_num
      print 'to big'
      @num_errors -= 1
    else
      print 'to small'
      @num_errors -= 1
    end

    @num_attempts += 1

    if @num_errors.zero?
      @game_over = true
    end
  end

  def ask_user
    print 'enter a number. '
    number = gets.chomp.to_i
    check_num(number)
  end

end

