module Enumerable
  def my_each
    for i in self do
      yield(i)
    end
    self
  end


  def my_each_with_index
    item = Hash.new(self)
    for i in self do
      yield(i)
    end
    self    
  end

  def my_select
    item = []
    for i in self do
      if yield(i) == true
        item <<  i
      end         
    end  
    item  
  end





end


test = %w[Marcos Samuel Ruby Rails Code Terminal]
test_hash = { name: 'Ruby', age: '25', height: '10' }

# p test.my_each { |itr| puts itr }
# p test.each { |itr| puts itr }

# p test_hash.my_each_with_index {|itr| puts itr}
# p test_hash.each_with_index {|itr| puts itr}

# p test_hash.my_select {|itr| itr == 'Ruby'}
