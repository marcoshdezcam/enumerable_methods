module Enumerable
  def my_each
    puts "It's alive"
  end
  module_function :my_each
end