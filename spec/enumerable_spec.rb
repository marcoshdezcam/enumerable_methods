# spec/Enumerable_spec.rb
require_relative '../main.rb'

describe Enumerable do
  let(:arr_num) { [1, 2, 3, 4, 5] }
  let(:arr_string) { %w[ant bear cat] }
  let(:ran) { (1..5) }
  let(:arg) { proc { |x| x**2 } }
  let(:temp_array) { [] }
  let(:wrong_type) { 'wrong' }

  describe '#my_each' do
    context 'When block is not given' do
      it 'it should return the Enumerator' do
        expect(arr_num.my_each).to be_an Enumerator
      end
    end
    context 'When a block is given' do
      it 'returns the original array' do
        expect(arr_num.my_each { |i| i + 10 }).to eql(arr_num)
      end
      it 'passes the block in each element' do
        temp_array = []
        arr_num.my_each { |i| temp_array << i * 10 }
        expect(temp_array).to eql([10, 20, 30, 40, 50])
      end
    end
    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_each }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_each_with_index' do
    context 'When block is not given' do
      it 'it should return the Enumerator' do
        expect(arr_num.my_each_with_index).to be_an Enumerator
      end
    end

    context 'When a block is given' do
      it 'returns the original array' do
        expect(arr_num.my_each_with_index { |e, i| e + i }).to eql(arr_num)
      end

      it 'passes the block in each element' do
        temp_array = []
        arr_num.my_each_with_index { |e, i| temp_array << e * i }
        expect(temp_array).to eql([0, 2, 6, 12, 20])
      end

      it 'returns index in a new array' do
        arr_num.my_each_with_index { |_e, i| temp_array << i }
        expect(temp_array).to eql([0, 1, 2, 3, 4])
      end
    end

    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_each_with_index }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_select' do
    context 'When a block is not given' do
      it 'it should return an Enumerator' do
        expect(arr_num.my_select).to be_an Enumerator
      end
    end

    context 'When a block is given' do
      it 'Returns an array containing all elements that were true for the given block.' do
        expect(arr_num.my_select { |i| i == 2 }).to eql([2])
      end

      it 'Returns an array containing all elements that were true, for a range.' do
        expect(ran.my_select { |i| i == 2 }).to eql([2])
      end
    end

    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_select }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_all?' do
    context 'When no block is given' do
      it 'return true when none of the collection members are false or nil.' do
        expect(arr_num.my_all?).to be(true)
      end
      it 'returns false if not all elements are equal to the argument' do
        expect(arr_string.my_all?(/t/)).to be(false)
      end

      it 'returns true if all elements are equal to the argument' do
        expect(arr_num.my_all?(Numeric)).to be(true)
      end
    end

    context 'When a block is given' do
      it 'The method returns true if the block never returns false or nil' do
        expect(arr_string.my_all? { |word| word.length >= 3 }).to be(true)
      end

      it 'The method returns false if the block ever returns false or nil' do
        expect(arr_string.my_all? { |word| word.length <= 3 }).to be(false)
      end
    end

    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_all? }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_any?' do
    context 'When block is no given' do
      it 'returns true if at least one element of the array is true' do
        expect(arr_num.my_any?).to be(true)
      end
      it 'returns false if none of the element are true' do
        expect(arr_num.my_any?(String)).to be(false)
      end
    end
    context 'When block is given' do
      it 'returns true if any element pass block condition' do
        expect(arr_string.my_any? { |word| word.length >= 3 }).to be(true)
      end

      it 'returns false if no element pass block condition' do
        expect(arr_string.my_any? { |word| word.length < 3 }).to be(false)
      end
    end
    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_any? }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_none?' do
    context 'When block is no given' do
      it 'returns false if at least one element is true' do
        expect(arr_num.my_none?).to be(false)
      end
      it 'returns true none of the elements are true' do
        expect(arr_num.my_none?(String)).to be(true)
      end
    end
    context 'When block is given' do
      it 'returns true if none of the elements pass block condition' do
        expect(arr_string.my_none? { |word| word.length == 5 }).to be(true)
      end

      it 'returns false if at least one element pass block condition' do
        expect(arr_string.my_none? { |word| word.length == 3 }).to be(false)
      end
    end
    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_none? }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_count' do
    context 'When no block is given' do
      it 'Returns the number of items in enum through enumeration' do
        expect(arr_num.my_count).to eql(arr_num.length)
      end

      it 'If an argument is given, counts the elements that are equal to te argument' do
        expect(arr_num.my_count(2)).to eql(1)
      end
    end
    context 'When a block is given' do
      it 'it counts the number of elements yielding a true value.' do
        expect(arr_num.my_count { |x| x == 2 }).to eql(1)
      end
    end
    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_count }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_map' do
    context 'When no block is given' do
      it 'It should return the Enumerator' do
        expect(arr_num.my_map).to be_an Enumerator
      end

      it 'It should work with a Proc as an argument' do
        expect(arr_num.my_map(arg)).to eql([1, 4, 9, 16, 25])
      end
    end

    context 'When a block is given' do
      it 'Returns a new array with the results of running block once for every element' do
        expect(arr_num.my_map { |i| i * i }).to eql([1, 4, 9, 16, 25])
      end
    end

    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_map }.to raise_error(NoMethodError)
      end
    end
  end

  describe '#my_inject' do
    context 'When no block is given' do
      it 'Returns a product using an acumulator given in the argument' do
        expect(arr_num.my_inject(1, :*)).to eql(120)
      end

      it 'Returns a sum using an acumulator given in the argument' do
        expect(ran.my_inject(5, :*)).to eql(600)
      end

      it 'Returns the sum of elements (numbers array)' do
        expect(arr_num.my_inject(:+)).to eql(15)
      end

      it 'Returns the product of elements (range)' do
        expect(ran.my_inject(:*)).to eql(120)
      end
    end

    context 'When a block is given' do
      it 'Combines all elements of array by applying a binary operation, specified by a block' do
        expect(arr_num.my_inject { |sum, n| sum + n }).to eql(15)
      end

      it 'Combines all elements of a range by applying a binary operation, specified by a block' do
        expect(ran.my_inject { |product, n| product * n }).to eql(120)
      end
    end

    context 'When the input is not an Enumerable' do
      it 'Wrong type error' do
        expect { wrong_type.my_inject }.to raise_error(NoMethodError)
      end
    end
  end
end
