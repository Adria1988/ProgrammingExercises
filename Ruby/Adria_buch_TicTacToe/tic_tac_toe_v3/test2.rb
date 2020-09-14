def get_position(positions_array)

  bol = false

  while bol == false
    print "Please two nums representing a position in the format 'row col'"
    get_chomp = gets.chomp
    positions = []
    nums = %w[1 2 3 4 5 6 7 8 9 0]
    get_chomp.split.each do |n|
      if nums.include?(n)
        positions << n.to_i
      else
        print 'please only enter intergers'
        return
      end
    end

    if positions.length != 2
      print 'Sorry,that was invalid'
      return
    end

    if positions_array.include?(positions)
      bol = true
    else
      puts "its no a legal position"
    end
  end

  p positions
end
positions_array = [[1,2],[2,3],[4,3]]
get_position(positions_array)