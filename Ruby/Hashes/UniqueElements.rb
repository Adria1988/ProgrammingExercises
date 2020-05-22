#Write a method unique_elements that takes in an array and returns a 
#new array where all duplicate elements are removed. Solve this using a hash.

def unique_elements(arr)
  hash = Hash.new(0)
   
  arr.each { |element| hash[element] += 1}
  hash.keys
 end