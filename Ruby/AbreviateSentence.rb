# frozen_string_literal: true

# Write a method abbreviate_sentence that takes in a sentence string
# and returns a new sentence where every word longer than 4 characters
# has all of it's vowels removed.

def abbreviate_sentence(sent)
  words = sent.split(' ')
  no_vowels = []
  words.each do |word|
    word.length > 4 ? no_vowels.push(word.delete('aeiou')) : no_vowels.push(word)
  end
  no_vowels.join(' ')
end

puts abbreviate_sentence('follow the yellow brick road') # => "fllw the yllw brck road"
puts abbreviate_sentence('what a wonderful life')
