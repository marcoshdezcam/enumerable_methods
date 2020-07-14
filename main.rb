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
    counter = 0
    for i in self do
      yield(i) ? counter += 1 : nil
    end
    counter == self.length
  end

  def my_any?
    counter = 0
    for i in self do
      yield(i) ? counter += 1 : nil
    end
    counter.positive?
  end

  def my_none?
    counter = 0
    for i in self do
      yield(i) ? counter += 1 : nil
    end
    counter.zero?
  end

  def my_count
    counter = 0
    if block_given?
      for i in self do
        yield(i) ? counter += 1 : nil
      end
      counter
    else
      self.size
    end
  end

  def my_map
    new_array = []
    for i in self do
      yield(i) ? new_array << true : new_array << false
    end
    new_array
  end

  def my_inject
    for i in self do
      yield(i, self)
    end
  end
end

test = %w[Ruby Marcos Patata Hipotenusa Sam]
test_range = 5...10
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

# p test.my_none? { |itr| itr == 'papa' }
# p test.my_none? { |itr| itr == 'Ruby' }

# p test.my_count
# p test.my_count { |itr| itr == "Marcos" }
# p test.count
# p test.count { |itr| itr == "Marcos" }

# p test.my_map { |itr| itr == "Ruby"}
# p test.map { |itr| itr == "Ruby"}

p test_range.my_inject { |sum, number| sum + number }
p test_range.inject { |sum, number| sum + number }
