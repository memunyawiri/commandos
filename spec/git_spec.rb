require 'git'

describe Git do
  subject(:git) { described_class.new('tips/git.txt') }
  let!(:filename) { 'tips/git.txt' }
  let!(:tips) { git.tips }

  describe 'initialization' do
    it 'throws an error if the tip file does not exist' do
      expect { Git.new('nonexistent_mv.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(tips.count).to eq file.readlines.size
      end
    end
  end

  describe '#suggest_tips' do
    describe 'Tip for branch' do
      it 'suggests using -r when branch is used' do
        expect(git.suggest_tips('branch').include?(tips[:branch])).to be true
      end
    end

    describe 'Tip for log' do
      it 'suggests using log when git is used' do
        expect(git.suggest_tips('push').include?(tips[:log])).to be true
      end

    end
  end
end
