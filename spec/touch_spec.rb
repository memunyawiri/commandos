require 'touch'

describe Touch do
  subject(:touch) { described_class.new('tips/touch.txt') }
  let!(:tips) { touch.tips }

  describe 'initialisation' do
    it 'throws and error if the touch tip file does not exist' do
      expect { Touch.new('nonexistent_touch.txt') }.to raise_error(Errno::ENOENT)
    end

    it 'loads the tips' do
      expect(touch.tips.count).to eq(1)
    end
  end

end
