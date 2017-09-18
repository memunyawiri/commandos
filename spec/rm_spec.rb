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
      it 'suggests using -i option when it is not used' do
        expect(rm.suggest_tips('test_file').include?(tips[:i])).to be true
      end

      it 'does not suggest using -i option when already used in an individual format' do
        expect(rm.suggest_tips('-i test_file').include?(tips[:i])).to be false
      end

      it 'does not suggest using -i option when already used in a combined format' do
        expect(rm.suggest_tips('-vi test_file').include?(tips[:i])).to be false
      end
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

  describe 'Tip for "v" flag' do
    it 'suggests using -v option when it is not used' do
      expect(rm.suggest_tips('test_file').include?(tips[:v])).to be true
    end

    it 'does not suggest using -v option with it is already used' do
      expect(rm.suggest_tips('-v test_file').include?(tips[:v])).to be false
    end
  end

  describe 'Tip for "d" flag' do
    it 'suggests using -d option when it is not used' do
      expect(rm.suggest_tips('test_file').include?(tips[:d])).to be true
    end

    it 'does not suggest using -d option with it is already used' do
      expect(rm.suggest_tips('-d test_file').include?(tips[:d])).to be false
    end
  end

  describe 'Tip for "f" flag' do
    context 'without "r" flag' do
      it 'suggests using -f option when it is not used' do
        expect(rm.suggest_tips('test_file').include?(tips[:f])).to be true
      end

      it 'does not suggest using -f option when already used in an individual format' do
        expect(rm.suggest_tips('-f test_file').include?(tips[:f])).to be false
      end
    end

    context 'with "r" flag' do
      it 'suggests using -rf option when it is not used' do
        expect(rm.suggest_tips('-r test_file').include?(tips[:rf])).to be true
      end

      it 'does not suggest using -rf option when already used in an individual format' do
        expect(rm.suggest_tips('-r -f test_file').include?(tips[:rf])).to be false
      end

      it 'does not suggest using -rf option when already used in a combined format' do
        expect(rm.suggest_tips('-rf test_file').include?(tips[:rf])).to be false
      end
    end
  end
end
