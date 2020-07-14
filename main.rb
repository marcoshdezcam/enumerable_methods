module Enumerable
  def my_each
    for i in self do
      yield(i)
    end
    self
  end

  def my_each_with_index
    for i in self do
      yield(i)
    end
    self
  end

  def my_select
    item = []
    for i in self do
      yield(i) ? item << i : nil
    end
    item
  end

  def my_all?
    len = self.length
    counter = 0
    for i in self do
      yield(i) ? counter += 1 : nil
    end
    counter == len ? true : false
  end

  def my_any?
    counter = 0
    for i in self do
      yield(i) ? counter += 1 : nil
    end
    counter > 0 ? true : false
  end

  def my_none?
    counter = 0
    for i in self do
      yield(i) ? counter += 1 : nil
    end
    counter == 0 ? true : false
  end

  def my_count?
    item = []
    counter = 0
    for i in self do
      yield(i) ?  item << i counter += 1 : nil
    end
    item
  end

  

end

test = %w[ Ruby Marcos Patata Hipotenusa Sam ]
test_hash = { name: 'Ruby', age: '25', height: '10' }

# p test.my_each { |itr| puts itr }
# p test.each { |itr| puts itr }

# p test_hash.my_each_with_index { |itr| puts itr}
# p test_hash.each_with_index { |itr| puts itr}

# p test.my_select { |itr| itr == 'Ruby' }
# p test.select { |itr| itr == 'Ruby' }

# p test.my_all? { |itr| itr == 'papa' }
# p test.my_all? { |itr| itr == 'Ruby' }

# p test.my_any? { |itr| itr == 'papa' }
# p test.my_any? { |itr| itr == 'Ruby' }

p test.my_none? { |itr| itr == 'papa' }
p test.my_none? { |itr| itr == 'Ruby' }