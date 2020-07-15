module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    arr = self
    tarr = arr.to_a
    i = 0
    while i < tarr.size
      yield tarr[i]
      i += 1
    end
    self
  end
end

# Test variables

test_string = %w[Ruby Marcos Patata Hipotenusa Sam]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

# Testing Each/My_Each
puts %(Testing my_each)

p test_string.my_each
p test_string.my_each { |itr| puts itr }
p test_numbers.my_each
p test_numbers.my_each { |itr| puts itr }
p test_range.my_each
p test_range.my_each { |itr| puts itr }
p test_hash.my_each
p test_hash.my_each { |itr| puts itr }

puts %(Testing each)

p test_string.each
p test_string.each { |itr| puts itr }
p test_numbers.each
p test_numbers.each { |itr| puts itr }
p test_range.each
p test_range.each { |itr| puts itr }
p test_hash.each
p test_hash.each { |itr| puts itr }
