module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    arr = self
    tarr = arr.to_a
    i = 0
    while i < tarr.size
      yield tarr[i]
      i += 1
    end
    self
  end

  def my_each_with_index
    return to_enum(:my_each_with_index) unless block_given?

    index = 0
    arr = self
    tarr = arr.to_a
    i = 0
    while i < arr.size
      yield(tarr[i])
      index += 1
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    item = []
    arr = self
    tarr = []
    if arr.class == Hash
      arr.my_each { |key, value| tarr << key }
    else
      tarr = arr.to_a
    end
    i = 0
    while i < tarr.size
      yield(tarr[i]) ? item << tarr[i] : nil
      i += 1
    end
    item
  end
  
  def my_all?(*args)
    return true unless block_given?
  
    arr = self.to_a
    counter = 0
    i = 0
    x = 0
    while i < arr.size
      arr[i] == arr[i + 1] ? counter += 1 : nil
      i += 1
    end
    yield(arr[x])
    counter == arr 
  end
end

# arr = self

# arr.my_each { yield(i) == yield(i) ? false  }