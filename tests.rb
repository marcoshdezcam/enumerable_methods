load 'main.rb'

module Enumerable
  def t_method(*args, &block)
    each(*args, &block) # Insert method to test
  end
  alias m_ruby t_method
  alias m_ours my_each # Insert method to test
end

# Test variables
t_name = 'my_each' #Change methods to be tested
t_comp = 'each'    #Change methods to be tested

test_string = %w[Ruby Marcos Patata Hipotenusa Sam]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

# Testing Each/My_Each
puts t_name
p test_string.m_ours
puts %()
puts t_comp
p test_string.m_ruby
puts %()
puts t_name
p test_string.m_ours { |itr| puts itr }
puts %()
puts t_comp
p test_string.m_ruby { |itr| puts itr }
puts %()

puts t_name
p test_numbers.m_ours
puts %()
puts t_comp
p test_numbers.m_ruby
puts %()
puts t_name
p test_numbers.m_ours { |itr| puts itr }
puts %()
puts t_comp
p test_numbers.m_ruby { |itr| puts itr }
puts %()

puts t_name
p test_range.m_ours
puts %()
puts t_comp
p test_range.m_ruby
puts %()
puts t_name
p test_range.m_ours { |itr| puts itr }
puts %()
puts t_comp
p test_range.m_ruby { |itr| puts itr }
puts %()

puts t_name
p %(my_each), test_hash.m_ours
puts %()
puts t_comp
p %(each), test_hash.m_ruby
puts %()
puts t_name
p %(my_each), test_hash.m_ours { |itr| puts itr }
puts %()
puts t_comp
p %(each), test_hash.m_ruby { |itr| puts itr }
