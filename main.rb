module Enumerable
  def my_each(name)
    yield name
  end
end

class Arreglo
  include Enumerable
end

test = Arreglo.new
test.my_each('Marcos') { |name| puts %(It's alive #{name}) }
