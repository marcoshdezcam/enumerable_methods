#spec/Enumerable_spec.rb
require_relative '../main.rb'

describe Enumerable do
  let(:arr_num) { [1, 2, 3, 4, 5] }
  let(:arr_string) { %w[ant bear cat] }
  let(:has_num) { { a: 1, b: 2 } }
  let(:ran) { (1..5) }
  let(:arg) { proc { |x| x**2 } }
  let(:temp_array) { [] }
  let(:wrong_type) { 'wrong' }

  describe '#my_each' do
    context 'when block is not given' do
      it 'it should return the Enumerator' do
        expect(arr_num.my_each).to be_an Enumerator
      end
    end
    context 'when a block is given' do
      it 'returns the original array' do
        expect(arr_num.my_each { |i| i + 10 }).to eql(arr_num)
      end
      it 'passes the block in each element' do
        temp_array = []
        arr_num.my_each { |i| temp_array << i * 10 }
        expect(temp_array).to eql([10, 20, 30, 40, 50])
      end
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
    context 'When block s given' do

      it 'returns the original array' do
        expect(arr_num.my_each_with_index { |e, i| e + i }).to eql(arr_num)
      end

      it 'passes the block in each element' do
        temp_array = []
        arr_num.my_each_with_index { |e, i| temp_array << e * i }
        expect(temp_array).to eql([0, 2, 6, 12, 20])
      end

      it 'returns index in a new array' do
        arr_num.my_each_with_index{|e, i| temp_array << i}
        expect(temp_array).to eql([0, 1, 2, 3, 4])
      end
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
        expect(arr_num.my_select{|i| i == 2}).to eql ([2])
      end

      it 'Returns an array containing all elements that were true, for a range.' do
        expect(ran.my_select{|i| i == 2}).to eql ([2])
      end

      it 'Wrong type error' do
        expect { wrong_type.my_select }.to raise_error(NoMethodError)
      end
    end
  end

  describe 'my_all?' do
    context 'When no block is given' do
      it 'return true when none of the collection members are false or nil.'do
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
  end
end
