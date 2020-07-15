load 'main.rb'
# Test variables
t_name = 'my_each'
t_comp = 'each'

test_string = %w[Ruby Marcos Patata Hipotenusa Sam]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

# Testing Each/My_Each
puts t_name
p test_string.meth.call
puts %()
puts t_comp
p test_string.each
puts %()
puts t_name
p test_string.my_each { |itr| puts itr }
puts %()
puts t_comp
p test_string.each { |itr| puts itr }
puts %()

puts t_name
p test_numbers.my_each
puts %()
puts t_comp
p test_numbers.each
puts %()
puts t_name
p test_numbers.my_each { |itr| puts itr }
puts %()
puts t_comp
p test_numbers.each { |itr| puts itr }
puts %()

puts t_name
p test_range.my_each
puts %()
puts t_comp
p test_range.each
puts %()
puts t_name
p test_range.my_each { |itr| puts itr }
puts %()
puts t_comp
p test_range.each { |itr| puts itr }
puts %()

puts t_name
p %(my_each), test_hash.my_each
puts %()
puts t_comp
p %(each), test_hash.each
puts %()
puts t_name
p %(my_each), test_hash.my_each { |itr| puts itr }
puts %()
puts t_comp
p %(each), test_hash.each { |itr| puts itr }
