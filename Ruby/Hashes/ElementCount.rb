# frozen_string_literal: true

# Write a method element_count that takes in an array
# and returns a hash representing the count of each element in the array.

def element_count(arr)
  hash = Hash.new(0)
  arr.each { |element| hash[element] += 1 }
  puts hash
end

puts element_count(%w[a b a a b]) #=> {"a"=>3, "b"=>2}
puts element_count(%w[red red blue green]) #=> {"red"=>2, "blue"=>1, "green"=>1}
