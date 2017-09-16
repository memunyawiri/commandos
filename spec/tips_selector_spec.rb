require 'tips_selector'

describe TipsSelector do
  subject(:tips_selector) { described_class.new }
  let!(:tips) do
    ['-a gives you hidden files as well',
     'You can switch between 2 directories using cd -']
  end
  let!(:seed) { 2400 }

  describe 'select' do
    before do
      srand(seed)
    end

    it 'selects a tip at random' do
      expect(tips_selector.select_tip(tips)).to eq tips[1]
    end
  end
end
