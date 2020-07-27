module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    arr = to_a if self.class == Hash || self.class == Range
    while i < size
      if self.class == Hash || self.class == Range
        yield(arr.at(i))
      else
        yield(at(i))
      end
      i += 1
    end
    self
  end

  def my_each_with_index(*arg, &block)
    return to_enum(:my_each_with_index) unless block_given? && !arg.empty?

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
      arr.my_each { |key, _value| tarr << key }
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
    flag = 0
    case args.empty?
    when true
      if block_given?
        my_each { |i| flag += 1 if yield(i) }
      else
        my_each { |i| flag += 1 unless i.nil? || i == false }
      end
    when false
      my_each { |i| flag += 1 if i.eql?(args[0]) }
    end
    return true if flag == size
    return false if flag != size
  end

  def my_any?(*args)
    flag = 0
    case args.empty?
    when true
      if block_given?
        my_each { |i| flag += 1 if yield(i) }
      else
        my_each { |i| flag += 1 unless i.nil? || i == false }
      end
    when false 
      my_each { |i| flag += 1 if i.eql?(args[0]) }
    end
    return true if flag.positive?
    return false if flag <= 0
  end

  def my_none?(*args)
    counter = 0
    case !block_given?
    when true
      if args.empty?
        my_each { |i| counter += 1 if i == true }
      else
        my_each { |i| counter += 1 if i == args[0] || i.equal?(args[0]) }
      end
    when false
      my_each { |i| counter += 1 if yield(i) == true }
    end
    return true if counter.zero?
    return false if counter.positive?
  end

  def my_count(*arg)
    counter = 0
    case !block_given?
    when true
      if arg.empty?
        size
      else
        my_each { |i| counter += 1 if arg[0] == i }
        counter
      end
    when false
      my_each { |i| counter += 1 if yield(i) == true }
      counter
    end
  end

  def my_map(*args)
    return to_enum(:my_map) unless block_given?

    new_array = []
    my_each { |i| new_array << yield(i) }
    new_array
  end
  
  def my_inject(*arg) 
    acc = 0
    case block_given?
    when true
      puts %(Bloque)
      if arg.empty?
        my_each { |i| acc = yield(acc, i) }
      else
        acc = arg[0]
        my_each { |i| acc = yield(acc, i) }
      end
      acc
    when false
      arg[0].is_a?(Symbol) ? acc = 0 : acc = arg[0]
      if arg.include?(:+)
        puts %(Argumento suma)
        my_each { |i| acc += i }
      else
        puts %(Argumento multi)
        acc = 1
        my_each { |i| acc *= i }
      end
    end
    acc
  end
end
