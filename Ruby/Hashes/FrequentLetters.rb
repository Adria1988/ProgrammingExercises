#Frequent Letters
#Write a method frequent_letters that takes in a string and returns an array 
#containing the characters that appeared more than twice in the string.

def frequent_letters(string)
  count = Hash.new(0)

  new_array = []
  string.each_char do |char|
   count[char] += 1
  end
  count.each do |char,num|
    if num > 2
      new_array << char
    end
  end
   new_array
end