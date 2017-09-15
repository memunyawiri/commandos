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
        expect(rm.tips.count).to eq file.readlines.size
      end
    end
  end
end
