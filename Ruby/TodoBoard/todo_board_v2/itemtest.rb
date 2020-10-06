def valid_date?(string)
  p string.split("-")
  arr_date = string.split("-").map(&:to_i)
  year, month, day = arr_date

  return false if month > 12 || day > 31 || arr_date.length > 3

  true

end


p valid_date?('2019-10-25')
p valid_date?('1912-06-23')
p valid_date?('2018-13-20')
p valid_date?('2018-12-32')
p valid_date?('10-25-2019')
p valid_date?('10-25-2019-2')