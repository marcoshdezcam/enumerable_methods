load 'main.rb'
module Enumerable
  def t_method(*args, &block)
    inject(*args, &block) # Insert method to test
  end
  alias m_ruby t_method
  alias m_ours my_inject # Insert method to test
end
# Test variables
t_name = 'MY_INJECT' # Change methods to be tested
t_comp = 'INJECT' # Change methods to be tested
test_strings = %w[Marcos Marcos Marcos Sam Marcos]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

puts %(--> TEST_RANGE -- )
puts t_comp
p test_range.m_ruby {  |sum, n| sum + n }
puts %()
puts t_name
p test_range.m_ours {  |sum, n| sum + n }
puts %()
puts t_comp
p test_range.m_ruby(:+)
puts %()
puts t_name
p test_range.m_ours(:+)
puts %()
puts t_comp
p test_range.m_ruby(10, :+)
puts %()
puts t_name
p test_range.m_ours(10, :+)
puts %()
puts t_comp
p test_range.m_ruby(:*)
puts %()
puts t_name
p test_range.m_ours(:*)
puts %()
puts t_comp
p test_range.m_ruby(5) { |product, n| product * n }
puts %()
puts t_name
p test_range.m_ours(5) { |product, n| product * n }
puts %()

puts t_comp
longest = %w{ cat sheep bear }.m_ruby do |memo, word|
  memo.length > word.length ? memo : word
end
p longest
puts %()

puts t_comp
longest_ours = %w{ cat sheep bear }.m_ours do |memo, word|
  memo.length > word.length ? memo : word
end
p longest_ours
puts %()
