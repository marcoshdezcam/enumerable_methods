# rubocop: disable Metrics/ModuleLength
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
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

  def my_each_with_index(*arg)
    return to_enum(:my_each_with_index) unless block_given? && arg.empty?

    index = 0
    arr = self
    tarr = arr.to_a
    i = 0
    while i < arr.size
      yield(tarr[i], index)
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
    i = 0
    arr = self
    is_a?(Range) || is_a?(Hash) ? arr = arr.to_a : nil

  
    case args.empty?
    when true
      if block_given?
   
        blk = yield(arr.at(i))
        arr.my_each { |i| flag += 1 if blk == true }
      # elsif is_a?(Range)
      #   blk = yield(arr[i])
      #   my_each { |i| flag += 1 if blk == true }
      else
        arr.my_each { |i| flag += 1 unless i.nil? || i == false }
      end
    when false
      arr.my_each { |i| flag += 1 if i.is_a?(args[0]) }
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

  def my_map(*arg)
    case block_given?
    when true
      new_array = []
      my_each do |i|
        new_array << yield(i)
      end
      new_array
    when false && !arg.empty?
      proc { arg }
    when false && arg.empty?
      return to_enum(:my_map) unless block_given?
    end
  end

  def my_inject(arg = nil, sim = nil)
    if block_given?
      acc = arg
      my_each { |i| acc = acc.nil? ? i : yield(acc, i) }
    elsif !arg.nil? && arg.is_a?(Symbol)
      acc = nil
      my_each { |i| acc = acc.nil? ? i : acc.send(arg, i) }
    elsif !sim.nil? && sim.is_a?(Symbol)
      acc = arg
      my_each { |i| acc = acc.nil? ? i : acc.send(sim, i) }
    end
    acc
  end
end

# rubocop: enable Metrics/ModuleLength
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

def multiply_els(array)
  array.my_inject(:*)
end
