load 'main.rb'
module Enumerable
  def t_method(*args, &block)
    map(*args, &block) # Insert method to test
  end
  alias m_ruby t_method
  alias m_ours my_map # Insert method to test
end
# Test variables
t_name = 'MY_MAP?' # Change methods to be tested
t_comp = 'MAP' # Change methods to be tested
test_strings = %w[Marcos Marcos Marcos Sam Marcos]
test_numbers = [1, 2, 3, 4, 5]
test_range = 5...10
test_hash = { name: 'Ruby', age: '25', height: '10' }

puts %(--> MULTIPLY ELSE --- )
p multiply_els([2, 4, 5])

