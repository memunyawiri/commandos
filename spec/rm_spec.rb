require 'rm'

describe Rm do
  subject(:rm) { described_class.new(filename) }
  let!(:filename) { 'tips/rm.txt' }
  let!(:tips) { rm.tips }

  describe 'initialisation' do
    it 'throws an error if the tip file does not exist' do
      expect { Rm.new('nonexistent_rm.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(tips.count).to eq file.readlines.size
      end
    end
  end

  describe 'Tip for "i" flag' do
    context 'without "r" flag' do

    end

    context 'with "r" flag' do
      it 'suggests using -i option when it is not used' do
        expect(rm.suggest_tips('-r test_file').include?(tips[:ri])).to be true
      end

      it 'does not suggest using -i option when already used in an individual format' do
        expect(rm.suggest_tips('-r -i test_file').include?(tips[:ri])).to be false
      end

      it 'does not suggest using -i option when already used in a combined format' do
        expect(rm.suggest_tips('-ri test_file').include?(tips[:ri])).to be false
      end
    end
  end
end
