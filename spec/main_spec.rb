require_relative '../main'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 6, 7] }
  let(:range) { (1..7) }
  let(:hash) { { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7 } }
  let(:array_of_strings) { %w[Hello World Ruby Ceci Marcos] }

  describe %(#my_each) do
    it %(Prints array elements) do
      expect { array.my_each { |item| puts item } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end

    it %(Prints the elements in the range) do
      expect { range.my_each { |item| puts item } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end

    it %(Prints the values in a hash) do
      expect { hash.my_each { |_key, value| puts value } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end

    it %(Prints the keys in a hash) do
      expect { hash.my_each { |key, _value| puts key } }.to output("1\n2\n3\n4\n5\n6\n7\n").to_stdout
    end

    it %(Check if returns the enumerator) do
      expect(array.my_each).to be_an_instance_of Enumerator
    end

    it %(Prints the elements in the array of strings) do
      expect { array_of_strings.my_each { |item| puts item } }.to output("Hello\nWorld\nRuby\nCeci\nMarcos\n").to_stdout
    end
  end

  describe %(#my_each_with_index) do
    it %(Prints array elements and the index) do
      expected = "item: 1 index: 0\n"\
      "item: 2 index: 1\n"\
      "item: 3 index: 2\n"\
      "item: 4 index: 3\n"\
      "item: 5 index: 4\n"\
      "item: 6 index: 5\n"\
      "item: 7 index: 6\n"
      expect { array.my_each_with_index { |x, i| puts "item: #{x} index: #{i}" } }.to output(expected).to_stdout
    end

    it %(Prints the elements in a range and the index) do
      expected = "item: 1 index: 0\n"\
      "item: 2 index: 1\n"\
      "item: 3 index: 2\n"\
      "item: 4 index: 3\n"\
      "item: 5 index: 4\n"\
      "item: 6 index: 5\n"\
      "item: 7 index: 6\n"
      expect { range.my_each_with_index { |x, i| puts "item: #{x} index: #{i}" } }.to output(expected).to_stdout
    end

    it %(Prints the key value pairs in a hash and the index) do
      expected = "key and value: [1, 1] index: 0\n"\
      "key and value: [2, 2] index: 1\n"\
      "key and value: [3, 3] index: 2\n"\
      "key and value: [4, 4] index: 3\n"\
      "key and value: [5, 5] index: 4\n"\
      "key and value: [6, 6] index: 5\n"\
      "key and value: [7, 7] index: 6\n"
      expect do
        hash.my_each_with_index do |kv, i|
          puts "key and value: #{kv} index: #{i}"
        end
      end.to output(expected).to_stdout
    end

    it %(Check if returns the enumerator) do
      expect(array.my_each_with_index).to be_an_instance_of Enumerator
    end

    it %(Prints the elements in the array of strings with their respected indexes) do
      expected =
        "Hello in position 0\nWorld in position 1\nRuby in position 2\n"\
        "Ceci in position 3\nMarcos in position 4\n"
      expect do
        array_of_strings.my_each_with_index do |x, i|
          puts "#{x} in position #{i}"
        end
      end.to output(expected).to_stdout
    end
  end

  describe %(#my_select) do
    it %(Returs the Enumerator) do
      expect(range.my_select).to be_an_instance_of Enumerator
    end

    it %(Return an array of integers smaller than 4) do
      expect(array.my_select { |x| x < 4 }).to eql([1, 2, 3])
    end

    it %(Return the even numbers in the range 1 to 7) do
      expect(range.my_select(&:even?)).to eql([2, 4, 6])
    end

    it %(Returns an array of strings where every string in less than 5 characters long) do
      expect(array_of_strings.my_select { |x| x.size < 5 }).to eql(%w[Ruby Ceci])
    end
  end

  describe %(#my_all) do
    it %(Returns true when all the elements of the array are less than 8) do
      expect(array.my_all? { |x| x < 8 }).to eql(true)
    end

    it %(Returns false when all the elements of the array are greater than 8) do
      expect(array.my_all? { |x| x > 8 }).to eql(false)
    end

    it %(Returns false if it finds the regex on all elements of the array) do
      expect(array_of_strings.my_all?(/o/)).to eql(false)
    end
  end
end
