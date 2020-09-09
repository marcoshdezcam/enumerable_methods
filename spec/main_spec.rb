require_relative '../main'

describe Enumerable do 
  let(:array) { [1, 2, 3, 4, 5, 6, 7] }
  describe "#my_each" do 
    it "Printing array elements" do 
      expect { array.my_each { |x| puts x } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end
  end
end