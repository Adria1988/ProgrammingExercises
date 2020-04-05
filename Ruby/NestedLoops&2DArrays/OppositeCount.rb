# frozen_string_literal: true

# Write a method opposite_count that takes in an array of unique numbers.
# The method should return the number of pairs of elements that sum to 0.

def opposite_count(nums)
  count = 0
  nums.each_with_index do |num1, indx1|
    nums.each_with_index do |num2, indx2|
      result = num1 + num2
      count += 1 if indx2 > indx1 && result == 0
    end
  end
  count
end

puts opposite_count([2, 5, 11, -5, -2, 7]) # => 2
puts opposite_count([21, -23, 24 - 12, 23]) # => 1
