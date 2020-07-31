load 'main.rb'
module Enumerable
  def t_method(*args, &block)
    all?(*args, &block) # Insert method to test
  end
  alias m_ruby t_method
  alias m_ours my_all? # Insert method to test
end
# Test variables
t_name = 'MY_ALL?' # Change methods to be tested
t_comp = 'ALL' # Change methods to be tested
test_strings = %w[Ruby Ruby Ruby Ruby Ruby]
test_numbers = [1, 2, 3, 4, 5]
test_numbers_d = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

puts %(--> TSE TESTS--- )
puts t_comp
p ['x' , 1, 5i, 5.67].m_ruby(Numeric)
puts t_name
p ['x', 1, 5i, 5.67].m_ours(Numeric) # => true
puts %()
puts t_comp
p [2, 1, 6, 7, 4, 8, 10].m_ruby(Integer)
puts t_name
p [2, 1, 6, 7, 4, 8, 10].m_ours(Integer) # => true
puts %()
puts t_comp
p test_strings.m_ruby(/t/)
puts t_name
p test_strings.m_ours(/t/)
puts %()
puts t_comp
p test_strings.m_ruby(/R/)
puts t_name
p test_strings.m_ours(/R/)
puts %()
puts t_comp
p test_strings.m_ruby(a)
puts t_name
p test_strings.m_ours(1)
puts %()
puts %(--> TEST_ARRAY_STRINGS --- )
puts t_comp
p test_strings.m_ruby
puts t_name
p test_strings.m_ours
puts %()
puts t_comp
p test_strings.m_ruby { |i| puts %(Element: #{i}) if i == 'Ruby' }
puts t_name
p test_strings.m_ours { |i| puts %(Element: #{i}) if i == 'Ruby' }
puts %()
puts %(-->  TEST_NUMBERS -- )
puts t_comp
p test_numbers.m_ruby
puts t_name
p test_numbers.m_ours
puts %()
puts t_comp
p test_numbers.m_ruby { |i| puts i unless i >= 4 }
puts t_name
p test_numbers.m_ours { |i| puts i unless i >= 4 }
puts %()
puts %(--> TEST_RANGE -- )
puts t_comp
p test_range.m_ruby
puts t_name
p test_range.m_ours
puts %()
puts t_comp
p test_range.m_ruby { |i| puts i }
puts t_name
p test_range.m_ours { |i| puts i }
puts %()
puts %(--> TEST_HASH -- )
puts t_comp
p test_hash.m_ruby
puts t_name
p test_hash.m_ours
puts %()
puts t_comp
p test_hash.m_ruby { |key, value| puts %(#{key} -&- #{value}.)}
puts t_name
p test_hash.m_ours { |key, value| puts %(#{key} -&- #{value}.)}
puts %()