require_relative '../main'

describe Enumerable do 
  let(:array) { [1, 2, 3, 4, 5, 6, 7] }
  let(:range) { (1..7) } 
  let(:hash) { { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7} }
  let(:array_of_strings) { %w[Hello World Ruby Ceci Marcos]}

  describe "#my_each" do 
    it "Printing array elements" do 
      expect { array.my_each { |x| puts x } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end 

    it 'Printing the elements in the range' do
      expect { range.my_each { |x| puts x } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end 

    it 'Printing the values in a hash' do
      expect { hash.my_each { |k, v| puts v } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end 

    it 'Printing the keys in a hash' do
      expect { hash.my_each { |k, v| puts k } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end

    it 'Check if returns the enumerator' do
      expect(array.my_each).to be_an_instance_of Enumerator
    end

    it 'should print the elements in the array of strings' do
      expect { array_of_strings.my_each { |x| puts x } }.to output("Hello\nWorld\nRuby\nCeci\nMarcos\n").to_stdout
    end
  end
end