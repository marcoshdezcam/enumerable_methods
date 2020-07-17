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
    if block_given? # lo salta
      arr.my_each { |i| flag = yield(i) }
    elsif !block_given? && !args.empty?      
      flag = arr.my_each { |i| i == args }
      if flag == false || nil
        return true
      else 
        return false
      end
    else
      puts %(NO BLOCK)
      flag = arr.each { |i| i }
      if flag != false || nil 
        return true
      end
    end
    flag
    end 
end