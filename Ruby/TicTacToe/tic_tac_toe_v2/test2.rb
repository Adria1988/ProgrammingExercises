def get_position
  print "Please two nums representing a position in the format 'row col'"
  get_chomp = gets.chomp

  positions = []
  nums = %w[1 2 3 4 5 6 7 8 9 0]
  get_chomp.each_char do |n|
    if nums.include?(n) || n == ' '
      if n == ' '
        n = 13
      end
      positions << n.to_i
    else
      print 'please only enter intergers'
      return
    end
  end
  positions.delete(13)

  if positions.length != 2
    print 'Sorry,that was invalid'
    return
  end

  p positions
end
get_position