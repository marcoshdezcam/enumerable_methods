load 'main.rb'
# Test variables

test_string = %w[Ruby Marcos Patata Hipotenusa Sam]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

# Testing Each/My_Each
puts %(my_each)
p test_string.my_each
puts %()
puts %(each)
p test_string.each
puts %()
puts %(my_each)
p test_string.my_each { |itr| puts itr }
puts %()
puts %(each)
p test_string.each { |itr| puts itr }
puts %()

puts %(my_each)
p test_numbers.my_each
puts %()
puts %(each)
p test_numbers.each
puts %()
puts %(my_each)
p test_numbers.my_each { |itr| puts itr }
puts %()
puts %(each)
p test_numbers.each { |itr| puts itr }
puts %()

puts %(my_each)
p test_range.my_each
puts %()
puts %(each)
p test_range.each
puts %()
puts %(my_each)
p test_range.my_each { |itr| puts itr }
puts %()
puts %(each)
p test_range.each { |itr| puts itr }
puts %()

puts %(my_each)
p %(my_each), test_hash.my_each
puts %()
puts %(each)
p %(each), test_hash.each
puts %()
puts %(my_each)
p %(my_each), test_hash.my_each { |itr| puts itr }
puts %()
puts %(each)
p %(each), test_hash.each { |itr| puts itr }
