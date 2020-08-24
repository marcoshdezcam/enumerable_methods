#spec/Enumerable_spec.rb
require_relative '../main.rb'

describe Enumerable do
  let(:arr_num) { [1, 2, 3, 4, 5] }
  let(:arr_string) { %w[ant bear cat] }
  let(:has_num) { { a: 1, b: 2 } }
  let(:ran) { (1..5) }
  let(:arg) { proc { |x| x**2 } }

  describe '#my_each' do
    context 'when block is not given' do
      it 'it should return the Enumerator' do
        expect(arr_num.my_each).to be_an Enumerator
      end

      it 'it should return the Enumerator' do
        expect(arr_string.my_each).to be_an Enumerator
      end

      it 'it should return the Enumerator' do
        expect(has_num.my_each).to be_an Enumerator
      end

      it 'it should return the Enumerator' do
        expect(ran.my_each).to be_an Enumerator
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
    end
  end

  describe '#my_each_with_index' do
  
  end    
end




