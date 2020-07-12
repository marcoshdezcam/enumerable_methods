module Enumerable
  def my_each
    for i in self do
      yield(i)
    end
    self
  end
  def my_each_with_index(item, index)
    
  end
end

test = %w[Marcos Samuel Ruby Rails Code Terminal]
test_hash = { name: 'Ruby', age: '25', height: '10' }

test.my_each { |itr| puts itr }
test.each { |itr| puts itr }

test_hash.my_each_with_index {}
test.each_with_index
