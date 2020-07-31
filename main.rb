# rubocop: disable Metrics/ModuleLength, Style/ConditionalAssignment
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity
module Enumerable
  def my_each
    return to_enum(:my_each) unless block_given?

    i = 0
    self.class == Hash || self.class == Range ? arr = to_a : arr = self
    while i < size
      yield(arr[i])
      i += 1
    end
    self
  end

  def my_each_with_index(*arg)
    return to_enum(:my_each_with_index) unless block_given? && arg.empty?

    arr = to_a
    index = 0
    i = 0
    while i < arr.size
      yield(arr[i], index)
      index += 1
      i += 1
    end
    self
  end

  def my_select
    return to_enum(:my_select) unless block_given?

    self.class == Hash ? item = {} : item = []
    my_each { |i| item << i if yield(i) } if self.class != Hash
    my_each_with_index { |k| item << k[0] if yield(k[0]) } if self.class == Hash
    item
  end

  def my_all?(*args)
    flag = 0
    i = 0
    self.class == Hash || self.class == Range ? arr = to_a : arr = self
    case args.empty?
    when true
      if block_given?
        blk = yield(arr.at(i))
        arr.my_each { flag += 1 if blk == true }
      else
        arr.my_each { flag += 1 unless i.nil? || arr.at(i) == false }
      end
    when false
      if args[0].class == Regexp
        arr.my_each { |itr| flag += 1 if itr =~ args[0] } # Regular expresions    
      elsif args[0].class == Class
        arr.my_each { |itr| itr.is_a?(args[0]) ? flag += 1 : nil }
      else
        arr.my_each { |itr| flag += 1 if args[0] == itr }
      end
    end
    flag == size
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
      my_each { |i| flag += 1 if i.is_a?(args[0]) }
    end
    return true if flag.positive?
    return false if flag <= 0
  end

  def my_none?(*args)
    counter = 0
    case !block_given?
    when true
      if args.empty?
        my_each { |i| counter += 1 if i != true }
      else
        my_each { |i| counter += 1 if i == args[0] || i.is_a?(args[0]) }
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

# rubocop: enable Metrics/ModuleLength, Style/ConditionalAssignment
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity

def multiply_els(array)
  array.my_inject(:*)
end
