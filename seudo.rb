  def my_select
    item = []
    arr = self
    i = 0
    while i < arr.size
      yield(i) ? item << i : nil
      i += i
    end
    item
  end

  def my_all?(*args)
    counter = 0
    size = self.size
    i = 0
    while i < size
      yield(i) ? counter += 1 : nil
      i += 1
    end
    counter == size
  end

  def my_any?
    counter = 0
    size = self.size
    i = 0
    while i < size
      yield(i) ? counter += 1 : nil
      i += 1
    end
    counter.positive?
  end

  def my_none?
    counter = 0
    size = self.length
    i = 0
    while i < size
      yield(i) ? counter += 1 : nil
      i += 1
    end
    counter.zero?
  end

  def my_count
    counter = 0
    size = self.size
    i += 0
      while i < size 
        yield(i) ? counter += 1 : nil
        i += 1
      end
      counter
    else
      size
    end
  end

  def my_map
    new_array = []
    size = self.size
    i = 0
    while i < size 
      new_array << yield(i)
      i += 1
    end
    new_array
  end

  def my_inject
    size = self.size
    i = 0
    while i < size 
      yield(sum, i[i - 1])
      i += 1
    end
    sum
  end
end


# p test_hash.my_each_with_index { |item, index| puts %(#{item} on #{index} position) }
# p test_hash.each_with_index { |item, index| puts %(#{item} on #{index} position) }

# p test_hash.my_select { |itr| itr == 'Ruby' }
# p test_hash.select { |itr| itr == 'Ruby' }

# p test_string.my_all? { |itr| itr == 'papa' }
# p test_string.my_all? { |itr| itr == 'Ruby' }
# p test_string.all? {}

# p test_string.my_any? { |itr| itr == 'papa' }
# p test_string.my_any? { |itr| itr == 'Ruby' }
#   test_string.my_any? { |itr| itr == 'papa' }
# p test_string.my_any? { |itr| itr == 'Ruby' }
# p 

# p test_string.my_none? { |itr| itr == 'papa' }
# p test_string.my_none? { |itr| itr == 'Ruby' }

# p test_string.my_count { |itr| itr == "Marcos" }
# p test_string.count { |itr| itr == "Marcos" }

# p test_numbers.my_map { |itr| itr * 2}
# p test_numbers.map { |itr| itr * 2}

# p test_numbers.my_inject { |sum, number| sum + number }
# p test_numbers.inject { |sum, number| sum + number }
