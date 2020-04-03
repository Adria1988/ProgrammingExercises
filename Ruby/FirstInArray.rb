# frozen_string_literal: true

# First In Array
# Write a method first_in_array that takes in an array and two elements,
# the method should return the element that appears earlier in the array.

def first_in_array(arr, el1, el2)
  element1 = 0
  element2 = 0
  arr.each_with_index do |arr, i|
    arr.include?(el1) ? element1 = i : ''
    arr.include?(el2) ? element2 = i : ''
  end
  element1 < element2 ? el1 : el2
end

puts first_in_array(%w[a b c d], 'd', 'c'); # => "b"
puts first_in_array(%w[cat bird dog mouse], 'bird', 'mouse'); # => "dog"
