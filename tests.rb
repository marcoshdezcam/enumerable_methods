load 'main.rb'

module Enumerable
  def t_method(*args, &block)
    select(*args, &block) # Insert method to test
  end
  alias m_ruby t_method
  alias m_ours my_select # Insert method to test
end

# Test variables
# Change methods to be tested
t_name = 'MY_SELECT'
# Change methods to be tested
t_comp = 'SELECT'

test_strings = %w[Ruby Marcos Patata Hipotenusa Sam]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

puts %(TEST_ARRAY_STRINGS --> )
puts t_name
p test_strings.m_ours
puts %()
puts t_comp
p test_strings.m_ruby
puts %()
puts t_name
p test_strings.m_ours { |itr| puts itr }
puts %()
puts t_comp
p test_strings.m_ruby { |itr| puts itr }
puts %()

puts %(TEST_NUMBERS --> )
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

puts %(TEST_RANGE --> )
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

puts %(TEST_HASH --> )
puts t_name
p test_hash.m_ours
puts %()
puts t_comp
p test_hash.m_ruby
puts %()
puts t_name
p test_hash.m_ours { |itr| puts itr }
puts %()
puts t_comp
p test_hash.m_ruby { |itr| puts itr }
