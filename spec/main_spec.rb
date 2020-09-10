require_relative '../main'

describe Enumerable do
  let(:array) { [1, 2, 3, 4, 5, 6, 7] }
  let(:range) { (1..7) }
  let(:hash) { { 1 => 1, 2 => 2, 3 => 3, 4 => 4, 5 => 5, 6 => 6, 7 => 7 } }
  let(:array_of_strings) { %w[Hello World Ruby Ceci Marcos] }
  let(:array_nums_strings) { [1, 10, 50, 'Ceci', 55, 'Marcos'] }
  let(:array_false) { [false, 'Ceci', 'Marcos'] }
  let(:array_nil) { [nil, 'Ceci', 'Marcos'] }
  let(:array_all_cecis) { %w[Ceci Ceci Ceci] }
  let(:array_same_number) { [7, 7, 7, 7] }
  let(:array_int_float_complex) { [1, 2.5, 3i] }
  let(:array_falsy) { [false, false, nil] }
  let(:array_falsy_int) { [false, false, nil, 3] }
  let(:array_repeat) { [1, 2, 3, 3, 4, 3, 3, 3] }
  let(:hash_strings) { { girl: 'pink', boy: 'blue', alien: 'green' } }

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

    it %(Returns true when all element are Numeric) do
      expect(array.my_all?(Numeric)).to eql(true)
    end

    it %(Returns false when all elements aren't Numeric) do
      expect(array_nums_strings.my_all?(Numeric)).to eql(false)
    end

    it %(Returns false when the array has at least one false element) do
      expect(array_false.my_all?).to eql(false)
    end

    it %(Returns false when the array has at least one nil value) do
      expect(array_nil.my_all?).to eql(false)
    end

    it %(Returns true when the array doesn't have any false element) do
      expect(array.my_all?).to eql(true)
    end

    it %(Returns true when the array doesn't have any nil element) do
      expect(array_of_strings.my_all?).to eql(true)
    end

    it %(Returns true when all elements are 'Ceci') do
      expect(array_all_cecis.my_all?('Ceci')).to eql(true)
    end

    it %(Returns false when not all elements are 'Ceci') do
      expect(array_of_strings.my_all?('Ceci')).to eql(false)
    end

    it %(Returns true when all elements are 7) do
      expect(array_same_number.my_all?(7)).to eql(true)
    end

    it %(Returns false when all elements aren't 7) do
      expect(array.my_all?(7)).to eql(false)
    end
  end

  describe %(#my_any) do
    it %(Return true when at least on of the strings in the array is grater or equal to 4 characters long) do
      expect(array_of_strings.my_any? { |x| x.size >= 4 }).to eql(true)
    end

    it %(Return false when none of the strings in the array are greater or equal to 7 characters long) do
      expect(array_of_strings.my_any? { |x| x.size >= 7 }).to eql(false)
    end

    it %(Return true if at least one string in the array has the letter 'M') do
      expect(array_of_strings.my_any?(/M/)).to eql(true)
    end

    it %(Return false if none of the strings in the array has the letter 'z') do
      expect(array_of_strings.my_any?(/z/)).to eql(false)
    end

    it %(Return true if at least one of the elements in the array is a Float type) do
      expect(array_int_float_complex.my_any?(Float)).to eql(true)
    end

    it %(Return false if none of the elements in the array is a Float type) do
      expect(array_nums_strings.my_any?(Float)).to eql(false)
    end

    it %(Return false if each element in the array is falsy) do
      expect(array_falsy.my_any?).to eql(false)
    end

    it %(Return true if at least one of the elements in the array is truthy or valid) do
      expect(array_falsy_int.my_any?).to eql(true)
    end

    it %(Return true if one of the elements is number 1) do
      expect(array.my_any?(1)).to eql(true)
    end

    it %(Return false if none of the elements is number 1) do
      expect(array_false.my_any?(1)).to eql(false)
    end

    it %(Return true if at least one of the strings in the array is 'Marcos') do
      expect(array_of_strings.my_any?('Marcos')).to eql(true)
    end

    it %(Return false if none of the strings in the array is 'Marcos') do
      expect(array_all_cecis.my_any?('Marcos')).to eql(false)
    end
  end

  describe %(#my_none?) do
    it %(Return true when none of the strings in the array are greater or equal to 7 characters long) do
      expect(array_of_strings.my_none? { |x| x.size >= 7 }).to eql(true)
    end

    it %(Return false when at least one element in the array is greater or equal to 4 characters long) do
      expect(array_of_strings.my_none? { |x| x.size >= 4 }).to eql(false)
    end

    it %(Return true when none of the characters is equal to Regexp) do
      expect(array_of_strings.my_none?(/z/)).to eql(true)
    end

    it %(Return false when at least one of the characters is equal to Regexp) do
      expect(array_of_strings.my_none?(/l/)).to eql(false)
    end

    it %(Return true if none of the elements are Float instances) do
      expect(array.my_none?(Float)).to eql(true)
    end

    it %(Return false if at least one of the elements is an Integer instance) do
      expect(array.my_none?(Integer)).to eql(false)
    end

    it %(Returns true if all of the elements are falsy) do
      expect(array_falsy.my_none?).to eql(true)
    end

    it %(Return false if at least one of the elements is truthy) do
      expect(array_falsy_int.my_none?).to eql(false)
    end

    it %(Return true if none of the elements of the array is 10) do
      expect(array.my_none?(10)).to eql(true)
    end

    it %(Return false if at least one element of the array is 1) do
      expect(array.my_none?(1)).to eql(false)
    end

    it %(Return true if none of the strings of the array is 'VSCode') do
      expect(array_of_strings.my_none?('VSCode')).to eql(true)
    end

    it %(Return false if at least one string of the array is 'Ruby') do
      expect(array_of_strings.my_none?('Ruby')).to eql(false)
    end
  end

  describe %(#my_count) do
    it %(Returns the size of the array) do
      expect(array.my_count).to eql(7)
    end

    it %(Returns the number of elements inside the range) do
      expect(range.my_count).to eql(7)
    end

    it %(Returns the ammount of repetitions where the element appears) do
      expect(array_repeat.my_count(3)).to eql(5)
    end

    it %(Return the even numbers in the array (accepts a proc)) do
      expect(array_repeat.my_count(&:even?)).to eql(2)
    end

    it %(Return the ammount of elements that are smaller than 5) do
      expect(array.my_count { |x| x < 5 }).to eql(4)
    end
  end

  describe %(#my_map) do
    it %(Return the square of each element in an array (with a range)) do
      expect(range.my_map { |x| x**2 }).to eql([1, 4, 9, 16, 25, 36, 49])
    end

    it %(Return an instance of Enumerator when no block is given) do
      expect(range.my_map).to be_an_instance_of Enumerator
    end

    it %(Returns an array with the element passed as an argument repeated 7 times) do
      expect(range.my_map { 'dog' }).to eql(%w[dog dog dog dog dog dog dog])
    end

    it %(Return the square of each element in an array (with an array)) do
      expect(array.my_map { |x| x**2 }).to eql([1, 4, 9, 16, 25, 36, 49])
    end

    it %(Return a string that contains the key and value of the hash) do
      expect(hash_strings.my_map { |k, v| "#{k} is #{v}" }).to eql(['girl is pink', 'boy is blue', 'alien is green'])
    end

    it %(Returns the Regexp repeated 3 times ) do
      expect(array_all_cecis.my_map { /C/ }).to eql([/C/, /C/, /C/])
    end
  end

  describe %(my_inject) do
    it %(Return the sum of all elements in the range) do
      expect(range.my_inject { |sum, x| sum + x }).to eql(28)
    end

    it %(Return the sum of all elements in the range + the argument) do
      expect(range.my_inject(100) { |sum, x| sum + x }).to eql(128)
    end

    it %(Return the result of the operation defined in the symbol) do
      expect(range.my_inject(:*)).to eql(5040)
    end

    it %(Return the result of the operation defined in the symbol and a factor as an argument) do
      expect(range.my_inject(2, :*)).to eql(10_080)
    end
  end
end
