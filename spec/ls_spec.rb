require 'ls'

describe Ls do
  subject(:ls) { described_class.new }
  let!(:tips) { ls.tips }
  let!(:filename) { 'tips/ls.txt' }

  describe 'initialisation' do
    it 'throws an error if the tip file does not exist' do
      expect { Ls.new('nonexistent_ls.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(ls.tips.count).to eq file.readlines.size
      end
    end
  end

  describe '#suggest_tips' do
    describe 'Edge cases' do
      it 'passes all of the tips if none of the flags are used' do
        expect(ls.suggest_tips('')).to eq([tips[:a], tips[:l], tips[:t]])
      end
    end

    describe 'Tip for "a" flag' do
      it 'suggests using -a option when it is not used' do
        expect(ls.suggest_tips('-l').include?(tips[:a])).to be true
      end

      it 'does not suggest using -a option when already used in an individual format' do
        expect(ls.suggest_tips('-l -a').include?(tips[:a])).to be false
      end

      it 'does not suggest using -a option when already used in a combined format' do
        expect(ls.suggest_tips('-la').include?(tips[:a])).to be false
      end
    end

    describe 'Tip for "l" flag' do
      it 'suggests using -l option when it is not used' do
        expect(ls.suggest_tips('-a').include?(tips[:l])).to be true
      end

      it 'does not suggest using -l option when already used in an individual format' do
        expect(ls.suggest_tips('-l -a').include?(tips[:l])).to be false
      end

      it 'does not suggest using -l option when already used in a combined format' do
        expect(ls.suggest_tips('-la').include?(tips[:l])).to be false
      end
    end

    describe 'Tip for "t" flag' do
      it 'suggests using -t option when it is not used' do
        expect(ls.suggest_tips('ls').include?(tips[:t])).to be true
      end

      it 'does not suggest using -t option when already used in an individual format' do
        expect(ls.suggest_tips('ls -t -l').include?(tips[:t])).to be false
      end

      it 'does not suggest using -t option when already used in a combined format' do
        expect(ls.suggest_tips('ls -lt').include?(tips[:t])).to be false
      end
    end
  end
end
