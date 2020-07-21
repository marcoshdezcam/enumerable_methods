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
    arr = self
    flag = false
    case block_given?
    when true
      if !args.empty?
        puts %(WITH BLOCK, WITH ARGUMENTS)
      else
        puts %(WITH BLOCK, NO ARGUMENTS)
        arr.my_each { |i| flag = yield(i) }
      end
    when false
      if !args.empty?
        puts %(NO BLOCK, WITH ARGUMENTS)
      else
        arr.my_each { |i| flag = true unless i == false || i.nil? }
      end
    end
    flag
  end
end
