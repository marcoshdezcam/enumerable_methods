# rubocop: disable Metrics/ModuleLength, Style/ConditionalAssignment
# rubocop: disable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength
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
    self.class == Hash || self.class == Range ? arr = to_a : arr = self
    case args.empty?
    when true
      if block_given?
        arr.my_each do |i|
          break if yield(i).nil? || yield(i) == false

          flag += 1 if yield(i) != false || yield(i).nil?
        end
      else
        arr.my_each { |i| flag += 1 unless i.nil? || i == false }
      end
    when false
      if args[0].class == Regexp
        arr.my_each { |itr| flag += 1 if itr =~ args[0] }
      elsif args[0].class == Class
        arr.my_each { |itr| flag += 1 if itr.is_a?(args[0]) }
      else
        arr.my_each { |itr| flag += 1 if args[0] == itr }
      end
    end
    flag == size
  end

  def my_any?(*args, &block)
    flag = 0
    case args.empty?
    when true
      if block_given?
        my_each { |i| flag += 1 if block.call(i) }
      else
        my_each { |i| flag += 1 unless i.nil? || i == false }
      end
    when false
      if args[0].class == Regexp
        my_each { |itr| flag += 1 if itr =~ args[0] }
      elsif args[0].class == Class
        my_each { |itr| flag += 1 if itr.is_a?(args[0]) }
      else
        my_each { |itr| flag += 1 if args[0] == itr }
      end
    end
    flag.positive?
  end

  def my_none?(*args, &block)
    !my_any?(*args, &block)
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

  def my_map(my_proc = nil)
    return to_enum(__method__) if !block_given? && my_proc.nil?

    n_arr = []
    each { |element| n_arr << my_proc.call(element) } unless my_proc.nil?
    each { |element| n_arr << yield(element) } if block_given? && my_proc.nil?
    n_arr
  end

  def my_inject(arg = nil, sim = nil)
    if block_given?
      acc = arg
      my_each { |i| acc = acc.nil? ? i : yield(acc, i) }
      acc
    elsif !arg.nil? && arg.is_a?(Symbol)
      acc = nil
      my_each { |i| acc = acc.nil? ? i : acc.send(arg, i) }
      acc
    elsif !sim.nil? && sim.is_a?(Symbol)
      acc = arg
      my_each { |i| acc = acc.nil? ? i : acc.send(sim, i) }
      acc
    else
      yield
    end
  end
end

# rubocop: enable Metrics/ModuleLength, Style/ConditionalAssignment
# rubocop: enable Metrics/PerceivedComplexity, Metrics/CyclomaticComplexity, Metrics/MethodLength

def multiply_els(array)
  array.my_inject(:*)
end
