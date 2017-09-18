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
    it 'passes all of the tips if none of the flags or extensions are used' do
      expect(cat.suggest_tips('next_belly_file.txt')).to eq([tips[:b], tips[:n], tips[:>], tips[:head], tips[:tail], tips[:less]])
    end

    describe '-b flag suggestions' do
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

    describe 'Tip for > (right angle bracket) option' do
      it 'suggests tip for cat f1 f2 > f3 option when it is not used' do
        expect(cat.suggest_tips('belly_file.txt').include?(tips[:>])).to be true
      end

      it 'does not suggest using the > option when it is used' do
        expect(cat.suggest_tips('belly_file.txt > belly_file.txt belly_file.txt').include?(tips[:>])).to be false
      end
    end

    describe 'Tip for head option' do
      it 'suggests tip for head option when it is not used' do
        expect(cat.suggest_tips('belly_file.txt').include?(tips[:head])).to be true
      end

      it 'does not suggest using head option when already in use' do
        expect(cat.suggest_tips('next_party.txt | head -2').include?(tips[:head])).to be false
      end

      it 'does not misunderstand head in a file name as head option' do
        expect(cat.suggest_tips('head_file.txt').include?(tips[:head])).to be true
      end
    end

    describe 'Tip for tail option' do
     it 'suggests tip for tail option when it is not used' do
       expect(cat.suggest_tips('belly_file.txt').include?(tips[:tail])).to be true
     end

     it 'does not suggest using tail option when already in use' do
       expect(cat.suggest_tips('next_party.txt | tail -6').include?(tips[:tail])).to be false
     end

     it 'does not misunderstand tail in a file name as tail option' do
       expect(cat.suggest_tips('tail_file').include?(tips[:tail])).to be true
     end
   end

   describe 'Tip for less option' do
      it 'suggests tip for less option when it is not used' do
        expect(cat.suggest_tips('belly_file.txt').include?(tips[:less])).to be true
      end

      it 'does not suggest using less option when already in use' do
        expect(cat.suggest_tips('next_party.txt | less').include?(tips[:less])).to be false
      end

      it 'does not misunderstand less in a file name as less option' do
        expect(cat.suggest_tips('less_file.txt').include?(tips[:less])).to be true
      end
    end
  end
end
