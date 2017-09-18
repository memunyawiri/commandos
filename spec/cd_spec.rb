require 'cd'

describe Cd do
  subject(:cd) { described_class.new(filename) }
  let!(:filename) { 'tips/cd.txt' }
  let!(:tips) { cd.tips }

  describe 'initialisation' do
    it 'throws an error if the tip file does not exist' do
      expect { Cd.new('nonexistent_cd.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(tips.count).to eq file.readlines.size
      end
    end
  end

  describe '#suggest_tips' do
    describe 'Tip for hyphen' do
      it 'suggests using the hyphen when it is not used' do
        expect(cd.suggest_tips('ruby-kickstart').include?(tips[:hyphen])).to be true
      end

      it 'does not suggest using the hyphen option when already used' do
        expect(cd.suggest_tips('- ').include?(tips[:hyphen])).to be false
      end
    end

    describe 'Tip for tilde' do
      it 'suggests using the tilde when it is not used' do
        expect(cd.suggest_tips('ruby-kickstart').include?(tips[:tilde_or_empty])).to be true
      end

      it 'does not suggest using the tilde option when already used alone' do
        expect(cd.suggest_tips('~').include?(tips[:tilde_or_empty])).to be false
      end

      it 'does not suggest using the tilde option when already used in a path' do
        expect(cd.suggest_tips('~/projects').include?(tips[:tilde_or_empty])).to be false
      end
    end

    describe 'Tip for forward slash' do
      it 'suggests using the forward slash when it is not used' do
        expect(cd.suggest_tips('ruby-kickstart').include?(tips[:forward_slash])).to be true
      end

      it 'does not suggest using the forward slash option when already used' do
        expect(cd.suggest_tips('/').include?(tips[:forward_slash])).to be false
      end
    end

    describe 'Serves all tips when cd -, cd ~, cd, cd / tips are inapplicable' do
      it 'passes all of the tips' do
        expect(cd.suggest_tips('ruby-kickstart')).to eq(tips.values)
      end
    end
  end
end
