require 'mv'

describe Mv do
  subject(:mv) { described_class.new }
  let!(:filename) { 'tips/mv.txt' }
  let!(:tips) { mv.tips }

  describe 'initialization' do
    it 'throws an error if the tip file does not exist' do
      expect { Mv.new('nonexistent_mv.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(tips.count).to eq file.readlines.size
      end
    end
  end

  describe '#suggest_tips' do
    describe 'Tip for renaming a file' do
      it 'suggests using mv to rename a filename into a newfilename' do
        suggested_tips = mv.suggest_tips('test1.txt test2.txt')
        expected_tip = tips[:mv]
        expect(suggested_tips.include?(expected_tip)).to be true
      end
    end

    describe 'Tip for "i" flag' do
      it 'suggests tip' do
        suggested_tips = mv.suggest_tips('test2.txt test3.txt')
        expected_tip = tips[:i]
        expect(suggested_tips.include?(expected_tip)).to be true
      end

      it 'does not suggest using -i option when already used in an individual format' do
        suggested_tips = mv.suggest_tips('-i test2.txt test3.txt')
        expected_tip = tips[:i]
        expect(suggested_tips.include?(expected_tip)).to be false
      end

      it 'does not suggest using -i option when already used in a combined format' do
        suggested_tips = mv.suggest_tips('-fi test2.txt test3.txt')
        expected_tip = tips[:i]
        expect(suggested_tips.include?(expected_tip)).to be false
      end
    end

    describe 'Tip for "f" flag' do
      it 'suggests tip for the -f option' do
        suggested_tips = mv.suggest_tips('test2.txt test3.txt')
        expected_tip = tips[:f]
        expect(suggested_tips.include?(expected_tip)).to be true
      end

      it 'does not suggest using -f option when already used in an individual format' do
        suggested_tips = mv.suggest_tips('-f test2.txt test3.txt')
        expected_tip = tips[:f]
        expect(suggested_tips.include?(expected_tip)).to be false
      end

      it 'does not suggest using -f option when already used in a combined format' do
        suggested_tips = mv.suggest_tips('-fv test2.txt test3.txt')
        expected_tip = tips[:f]
        expect(suggested_tips.include?(expected_tip)).to be false
      end
    end

    describe 'Tip for "n" flag' do
      it 'suggests tip for the -n option' do
        suggested_tips = mv.suggest_tips('-f test2.txt test3.txt')
        expected_tip = tips[:n]
        expect(suggested_tips.include?(expected_tip)).to be true
      end

      it 'does not suggest using -n option when already used in an individual format' do
        suggested_tips = mv.suggest_tips('-n test2.txt test3.txt')
        expected_tip = tips[:n]
        expect(suggested_tips.include?(expected_tip)).to be false
      end

      it 'does not suggest using -n option when already used in a combined format' do
        suggested_tips = mv.suggest_tips('-fn test2.txt test3.txt')
        expected_tip = tips[:f]
        expect(suggested_tips.include?(expected_tip)).to be false
      end
    end

    describe 'Tip for "v" flag' do
      it 'suggests tip for the -v option' do
        suggested_tips = mv.suggest_tips('test2.txt test3.txt')
        expected_tip = tips[:v]
        expect(suggested_tips.include?(expected_tip)).to be true
      end

      it 'does not suggest using -v option when already used in an individual format' do
        suggested_tips = mv.suggest_tips('-v test2.txt test3.txt')
        expected_tip = tips[:v]
        expect(suggested_tips.include?(expected_tip)).to be false
      end

      it 'does not suggest using -n option when already used in a combined format' do
        suggested_tips = mv.suggest_tips('-fv test2.txt test3.txt')
        expected_tip = tips[:v]
        expect(suggested_tips.include?(expected_tip)).to be false
      end
    end
  end
end
