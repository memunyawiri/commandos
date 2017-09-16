require 'mv'

describe Mv do
  subject(:mv) { described_class.new('tips/mv.txt') }
  let!(:tips) { mv.tips }

  describe 'initialization' do
    it 'throws an error if the tip file does not exist' do
      expect { Mv.new('nonexistent_mv.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      expect(mv.tips.count).to eq 2
    end
  end

  describe '#suggest_tips' do
    describe 'Tip for renaming a file' do
      it 'suggests using mv to rename a filename into a newfilename' do
        expect(mv.suggest_tips('test1.txt ./newdir/test1.txt').include?(tips[:mv])).to be true
      end
    end

    describe 'Tip for "i" flag' do
      it 'suggests using -i option to receive a confirmation prompt before ovvewriting an existing file' do
        expect(mv.suggest_tips('test2.txt test3.txt').include?(tips[:i])).to be true
      end

      it 'does not suggest using -i option when already used in an individual format' do
        expect(mv.suggest_tips('-i test2.txt test3.txt').include?(tips[:i])).to be false
      end

      it 'does not suggest using -i option when already used in a combined format' do
        expect(mv.suggest_tips('-fi test_file').include?(tips[:i])).to be false
      end
    end

  end
end
