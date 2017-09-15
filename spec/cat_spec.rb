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

  describe '#suggest_tips' do
    it 'passes all of the tips if none of the flags are used' do
      expect(cat.suggest_tips('')).to eq([tips[:b], tips[:n]])
    end

    describe '-b flag sugestions' do
      it 'suggests the -b tip when it is not used' do
        expect(cat.suggest_tips('-n').include?(tips[:b])).to be true
      end

      it 'suggests does not suggest the -b when it is used' do
        expect(cat.suggest_tips('-b').include?(tips[:b])).to be false
      end
    end

    describe 'Tip for "n" flag' do
      it 'suggests using -n option when it is not used' do
        expect(cat.suggest_tips('-b').include?(tips[:n])).to be true
      end

      it 'does not suggest using -n option when already used in an individual format' do
        expect(cat.suggest_tips('-n').include?(tips[:n])).to be false
      end
    end
  end
end
