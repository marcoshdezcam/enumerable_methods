load 'main.rb'
module Enumerable
  def t_method(*args, &block)
    none?(*args, &block) # Insert method to test
  end
  alias m_ruby t_method
  alias m_ours my_none? # Insert method to test
end
# Test variables
t_name = 'MY_NONE?' # Change methods to be tested
t_comp = 'NONE?' # Change methods to be tested
test_strings = %w[Marcos Marcos Marcos Sam Marcos]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }
# puts %(--> TEST_ARRAY_STRINGS --- )
# puts t_comp
# p test_strings.m_ruby
# puts %()
# puts t_name
# p test_strings.m_ours
# puts %()
# puts t_comp
# p test_strings.m_ruby { |word| word.length >= 4 }
# puts %()
# puts t_name
# p test_strings.m_ours { |word| word.length >= 4 }
# puts %()
# puts t_comp
# p test_strings.m_ruby('Marcos')
# puts %()
# puts t_name
# p test_strings.m_ours('Marcos')
# puts %()
# puts %(-->  TEST_NUMBERS -- )
# puts t_comp
# p test_numbers.m_ruby
# puts %()
# puts t_name
# p test_numbers.m_ours
# puts %()
# puts t_comp
# p test_numbers.m_ruby { |i| i >= 2 }
# puts %()
# puts t_name
# p test_numbers.m_ours { |i| i >= 2 }
# puts %()
# puts t_comp
# p test_numbers.m_ruby(5)
# puts %()
# puts t_name
# p test_numbers.m_ours(5)
# puts %()
# puts %(--> TEST_RANGE -- )
# puts t_comp
# p test_range.m_ruby
# puts %()
# puts t_name
# p test_range.m_ours
# puts %()
# puts t_comp
# p test_range.m_ruby { |i| i < 2 }
# puts %()
# puts t_name
# p test_range.m_ours { |i| i < 2 }
# puts %()
# puts t_comp
# p test_range.m_ruby(5)
# puts %()
# puts t_name
# p test_range.m_ours(5)
# puts %()
# puts %(--> TEST_HASH -- )
# puts t_comp
# p test_hash.m_ruby
# puts %()
# puts t_name
# p test_hash.m_ours
# puts %()
# puts t_comp
# p test_hash.m_ruby { |key, value| key == "Ruby" || value == "Ruby"}
# puts %()
# puts t_name
# p test_hash.m_ours { |key, value| key == "Ruby" || value == "Ruby"}
# puts %()

puts %w{ant bear cat}.my_none? { |word| word.length == 5 } #=> true
puts %w{ant bear cat}.my_none? { |word| word.length >= 4 } #=> false
puts %w{ant bear cat}.my_none?(/t/)                        #=> true
puts [1, 3.14, 42].my_none?(Float)                         #=> false
puts [].my_none?                                           #=> true
puts [nil].my_none?                                        #=> true
puts [nil, false].my_none?                                 #=> true
puts [nil, false, true].my_none?                           #=> false