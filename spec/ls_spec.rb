require 'ls'

describe Ls do
  subject(:ls) { described_class.new }
  let!(:tip_a) { '-a would give you hidden files as well' }
  let!(:tip_l) { '-l would give you more information about your files' }
  let!(:tip_t) { '-t gives you a list of files sorted by time modified :-)' }

  describe '#suggest_tips' do
    describe 'Edge cases' do
      it 'passes all of the tips if none of the flags are used' do
        expect(ls.suggest_tips('')).to eq([tip_a, tip_l, tip_t])
      end
    end

    describe 'Tip for "a" flag' do
      it 'suggests using -a option when it is not used' do
        expect(ls.suggest_tips('-l').include?(tip_a)).to be true
      end

      it 'does not suggest using -a option when already used in an individual format' do
        expect(ls.suggest_tips('-l -a').include?(tip_a)).to be false
      end

      it 'does not suggest using -a option when already used in a combined format' do
        expect(ls.suggest_tips('-la').include?(tip_a)).to be false
      end
    end

    describe 'Tip for "l" flag' do
      it 'suggests using -l option when it is not used' do
        expect(ls.suggest_tips('-a').include?(tip_l)).to be true
      end

      it 'does not suggest using -l option when already used in an individual format' do
        expect(ls.suggest_tips('-l -a').include?(tip_l)).to be false
      end

      it 'does not suggest using -l option when already used in a combined format' do
        expect(ls.suggest_tips('-la').include?(tip_l)).to be false
      end
    end

    describe 'Tip for "t" flag' do
      it 'suggests using -t option when it is not used' do
        expect(ls.suggest_tips('ls').include?(tip_t)).to be true
      end

      it 'does not suggest using -t option when already used in an individual format' do
        expect(ls.suggest_tips('ls -t -l').include?(tip_t)).to be false
      end

      it 'does not suggest using -t option when already used in a combined format' do
        expect(ls.suggest_tips('ls -lt').include?(tip_t)).to be false
      end
    end
  end
end
