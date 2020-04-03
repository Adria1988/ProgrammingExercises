# frozen_string_literal: true

# Write a method format_name that takes in a name
# string and returns the name properly capitalized.

# Hint: use str.upcase and str.downcase
# "abc".upcase # => "ABC"

def format_name(str)
  arr = str.split(' ')
  format_name = ' '

  arr.each do |word|
    format_name += capitalizseName(word)
  end
  format_name
end

def capitalizseName(word)
  string = ' '
  word.each_char.with_index { |letter, i| string += i == 0 ? letter.upcase : letter.downcase }
  string
end
#
# Other Solution
#
# def format_name(str)
#   parts = str.split(" ")
#   new_parts = []
#
#   parts.each do |part|
#     new_parts << part[0].upcase + part[1..-1].downcase
#   end
#
#   return new_parts.join(" ")
# end
#

puts format_name('chase WILSON') # => "Chase Wilson"
puts format_name('brian CrAwFoRd scoTT') # => "Brian Crawford Scott"
