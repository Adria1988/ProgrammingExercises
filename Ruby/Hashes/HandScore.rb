# frozen_string_literal: true

# Write a method hand_score that takes in a string representing a hand of cards and
# returns its total score. You can assume the letters in the
# string are only A, K, Q, J. A is worth 4 points, K is 3 points, Q is 2 points, and J is 1 point.
# The letters of the input string not necessarily uppercase.

def hand_score(hand)
  hash = { 'A' => 4, 'K' => 3, 'Q' => 2, 'J' => 1 }
  count = 0

  hand.each_char do |ele|
    count += hash[ele.upcase]
  end
  count
end

puts hand_score('AQAJ') #=> 11
puts hand_score('jJka') #=> 9
