require 'cat'
describe Cat do
  subject(:cat) { described_class.new('tips/cat.txt') }
  let!(:filename) { 'tips/cat.txt' }
  let!(:tips) { cat.tips }

  describe 'initialisation' do
    it 'throws an error if the tip file does not exist' do
      expect { Cat.new('nonexistent_cat.txt') }.to raise_error(Errno::ENOENT)
    end
  end

  describe '#tips' do
    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(cat.tips.count).to eq file.readlines.size
      end
    end
  end

  describe '#suggest_tips' do
    it 'passes all of the tips if none of the flags are used' do
      expect(cat.suggest_tips('next_belly_file.txt')).to eq([tips[:b], tips[:n]])
    end

    describe '-b flag sugestions' do
      it 'suggests the -b tip when it is not used' do
        expect(cat.suggest_tips('-n next_belly_file.txt').include?(tips[:b])).to be true
      end

      it 'does not suggest the -b bens_best_burps.txt when it is used' do
        expect(cat.suggest_tips('-b bens_best_burps.txt').include?(tips[:b])).to be false
      end
    end

    describe 'Tip for "n" flag' do
      it 'suggests using -n option when it is not used' do
        expect(cat.suggest_tips('-b new_text.txt').include?(tips[:n])).to be true
      end

      it 'does not suggest using -n option when already used in an individual format' do
        expect(cat.suggest_tips('-n next_party.txt').include?(tips[:n])).to be false
      end
    end
  end
end
