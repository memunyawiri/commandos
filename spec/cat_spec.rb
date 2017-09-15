require 'cat'
describe Cat do
  subject(:cat) { described_class.new('tips/cat.txt') }
  let!(:tips) { cat.tips }

  describe 'initialisation' do
    it 'throws an error if the tip file does not exist' do
      expect { Cat.new('nonexistent_cd.txt') }.to raise_error(Errno::ENOENT)
    end
  end

  describe '#tips' do
    it 'loads the tips' do
      expect(cat.tips.count).to eq(2)
    end
  end
end
