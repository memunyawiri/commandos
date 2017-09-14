require 'cd'

describe Cd do
  subject(:cd) { described_class.new }
  let!(:tip_hyphen) { 'You can switch between 2 directories using cd -' }
  let!(:tip_tilde_or_empty) { 'Did you know that you return to your home directory using cd ~ or just cd' }
  let!(:tip_forward_slash) { 'Need to go to the very base of the file system? That’s what the forward slash is for: cd /' }
  let!(:all_tips) { [tip_hyphen, tip_tilde_or_empty, tip_forward_slash] }

  describe '#suggest_tips' do
    describe 'Tip for hyphen' do
      it 'suggests using the hyphen when it is not used' do
        expect(cd.suggest_tips('ruby-kickstart').include?(tip_hyphen)).to be true
      end

      it 'does not suggest using the hyphen option when already used' do
        expect(cd.suggest_tips('- ').include?(tip_hyphen)).to be false
      end
    end

    describe 'Tip for tilde' do
      it 'suggests using the tilde when it is not used' do
        expect(cd.suggest_tips('ruby-kickstart').include?(tip_tilde_or_empty)).to be true
      end

      it 'does not suggest using the tilde option when already used alone' do
        expect(cd.suggest_tips('~').include?(tip_tilde_or_empty)).to be false
      end

      it 'does not suggest using the tilde option when already used in a path' do
        expect(cd.suggest_tips('~/projects').include?(tip_tilde_or_empty)).to be false
      end
    end

    describe 'Tip for forward slash' do
      it 'suggests using the forward slash when it is not used' do
        expect(cd.suggest_tips('ruby-kickstart').include?(tip_forward_slash)).to be true
      end

      it 'does not suggest using the forward slash option when already used' do
        expect(cd.suggest_tips('/').include?(tip_forward_slash)).to be false
      end
    end

    describe 'Serves all tips when cd -, cd ~, cd, cd / tips are inapplicable' do
      it 'passes all of the tips' do
        expect(cd.suggest_tips('ruby-kickstart')).to eq(all_tips)
      end
    end
  end
end
