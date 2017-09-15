require 'mv'

describe Mv do
  subject(:mv) { described_class.new('tips/mv.txt') }
  let!(:tips) { mv.tips }

  describe 'initialization' do
    it 'throws an error if the tip file does not exist' do
      expect { Mv.new('nonexistent_mv.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      expect(mv.tips.count).to eq 1
    end
  end

  describe '#suggest_tips' do
    describe 'Tip for renaming a file' do
      it 'suggest using mv to rename a filename into a newfilename' do
        expect(mv.suggest_tips('test1.txt ./newdir/test1.txt').include?(tips[:mv])).to be true
      end
    end
  end
end
