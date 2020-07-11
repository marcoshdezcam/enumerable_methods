module Enumerable
  def my_each
    for i in self do
      yield(i)
    end
    self
  end
end

test = %w[Marcos Samuel Ruby Rails Code Terminal]

test.my_each { |itr| puts itr }
test.each { |itr| puts itr }
