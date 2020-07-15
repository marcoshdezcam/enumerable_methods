# def my_all?(*args)
#   counter = 0
#   size = self.size
#   i = 0
#   while i < size
#     yield(i) ? counter += 1 : nil
#     i += 1
#   end
#   counter == size
# end

# def my_any?
#   counter = 0
#   size = self.size
#   i = 0
#   while i < size
#     yield(i) ? counter += 1 : nil
#     i += 1
#   end
#   counter.positive?
# end

# def my_none?
#   counter = 0
#   size = self.length
#   i = 0
#   while i < size
#     yield(i) ? counter += 1 : nil
#     i += 1
#   end
#   counter.zero?
# end

# def my_count
#   counter = 0
#   size = self.size
#   i += 0
#     while i < size
#       yield(i) ? counter += 1 : nil
#       i += 1
#     end
#     counter
#   else
#     size
#   end
# end

# def my_map
#   new_array = []
#   size = self.size
#   i = 0
#   while i < size
#     new_array << yield(i)
#     i += 1
#   end
#   new_array
# end

# def my_inject
#   size = self.size
#   i = 0
#   while i < size
#     yield(sum, i[i - 1])
#     i += 1
#   end
#   sum
# end
