# frozen_string_literal: true

# Write a method retrieve_values that takes in two hashes and a key.
# The method should return an array containing the values from the
# two hashes that correspond with the given key.

def retrieve_values(hash1, hash2, key)
  str = []
  str << hash1[key]
  str << hash2[key]
  str
end

dog1 = { 'name' => 'Fido', 'color' => 'brown' }
dog2 = { 'name' => 'Spot', 'color' => 'white' }
print retrieve_values(dog1, dog2, 'name') #=> ["Fido", "Spot"]
print retrieve_values(dog1, dog2, 'color') #=> ["brown", "white"]
