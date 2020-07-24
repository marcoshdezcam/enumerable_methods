load 'main.rb'

module Enumerable
  def t_method(*args, &block)
    each(*args, &block) # Insert method to test
  end
  alias m_ruby t_method
  alias m_ours my_each # Insert method to test
end

# Test variables
t_name = 'MY_EACH?' # Change methods to be tested
t_comp = 'EACH' # Change methods to be tested

test_strings = %w[Ruby Marcos VSCode Sam Marcos]
test_numbers = [1, 2, 3, 4, 5]
test_numbers_d = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }
obj = Object.new
enum = obj.to_enum

puts %(--> TEST_ARRAY_STRINGS --- )
puts t_comp
p test_strings.m_ruby
puts %()
puts t_name
p test_strings.m_ours
puts %()
puts t_comp
p test_strings.m_ruby.to_a
puts %()
puts t_name
p test_strings.m_ours.to_a
puts %()
puts t_comp
p test_strings.m_ruby { |i| puts %(Element: #{i}) }
puts %()
puts t_name
p test_strings.m_ours { |i| puts %(Element: #{i}) }
puts %()

puts %(--> TEST_ENUM --- )
puts t_comp
p enum.m_ruby.equal?(enum)
puts %()
puts t_name
p enum.m_ours.equal?(enum)
puts %()

puts %(-->  TEST_NUMBERS -- )
puts t_comp
p test_numbers.m_ruby
puts %()
puts t_name
p test_numbers.m_ours
puts %()
puts t_comp
p test_numbers.m_ruby { |i| puts i unless i >= 4 }
puts %()
puts t_name
p test_numbers.m_ours { |i| puts i unless i >= 4 }
puts %()

puts %(--> TEST_RANGE -- )
puts t_comp
p test_range.m_ruby
puts %()
puts t_name
p test_range.m_ours
puts %()
puts t_comp
p test_range.m_ruby { |i| puts i }
puts %()
puts t_name
p test_range.m_ours { |i| puts i }
puts %()

puts %(--> TEST_HASH -- )
puts t_comp
p test_hash.m_ruby
puts %()
puts t_name
p test_hash.m_ours
puts %()
puts t_comp
p test_hash.m_ruby { |key, value| puts %(#{key} -&- #{value}.)}
puts %()
puts t_name
p test_hash.m_ours { |key, value| puts %(#{key} -&- #{value}.)}
puts %()
