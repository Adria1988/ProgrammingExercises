def find_short(t)

  arr = t.split(" ")
  min = []
  arr.each do |element|
  min << element.length
  end
  lowest = min.min
  return lowest

end


describe "Basic Tests" do
  it "Simple Cases" do
    Test.assert_equals(find_short("bitcoin take over the world maybe who knows perhaps"), 3)
    Test.assert_equals(find_short("turns out random test cases are easier than writing out basic ones"), 3)
    Test.assert_equals(find_short("lets talk about javascript the best language"), 3)
    Test.assert_equals(find_short("i want to travel the world writing code one day"), 1)
    Test.assert_equals(find_short("Lets all go on holiday somewhere very cold"), 2)
  end
end