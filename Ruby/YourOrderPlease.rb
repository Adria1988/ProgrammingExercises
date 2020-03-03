# frozen_string_literal: true

# Your task is to sort a given string.
# Each word in the string will contain a single number.
# This number is the position the word should have in the result.
# Note: Numbers can be from 1 to 9. So 1 will be the first word (not 0).
# If the input string is empty, return an empty string.
# The words in the input String will only contain valid consecutive numbers.

def order(words)
  arr = words.split
  # Usé una expresión regular ( \d+) para unir los números, luego obtuve el primer número ( first) y lo convertí en un objeto entero ( to_i).
  result = arr.sort_by { |s| s.scan(/\d+/).first.to_i }
  result.join(' ')
  #   words.split.sort_by{ |w| w[/\d/] }.join(' ')
end

Test.assert_equals(order('is2 Thi1s T4est 3a'), 'Thi1s is2 3a T4est')
Test.assert_equals(order('4of Fo1r pe6ople g3ood th5e the2'), 'Fo1r the2 g3ood 4of th5e pe6ople')
Test.assert_equals(order(''), '', 'Empty input should return empty string')
