require 'touch'

describe Touch do
  subject(:touch) { described_class.new }
  let!(:tips) { touch.tips }
  let!(:all_tips) { tips[:rm] }
  let!(:filename) { 'tips/touch.txt' }

  describe 'initialisation' do
    it 'throws an error if the touch tip file does not exist' do
      expect { Touch.new('nonexistent_touch.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      File.open(filename, 'r') do |file|
        expect(tips.count).to eq file.readlines.size
      end
    end
  end

  describe 'Tip for rm' do
    it 'suggests using rm with a filename when touch is used' do
      expect(touch.suggest_tips('ruby-kickstart').include?(tips[:rm])).to be true
    end
  end
end
