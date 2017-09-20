require 'tips_selector'

describe TipsSelector do
  subject(:tips_selector) { described_class.new('waited_tips_test.txt') }
  let!(:tips_selector2) { described_class.new('missing_waited_tips_test.txt') }
  let(:tips_selector3) { described_class.new('waited_tips_test.txt', 'missing_misc_tips.txt') }

  let!(:tips) do
    ['You can view more information about your files using ls -l',
     'You can switch between 2 directories using cd -',
     'You can use mv to rename a file.',
     'You can return to your home directory using cd ~ or just cd']
  end
  let!(:seed) { 2400 }

  describe 'initialize' do
    it 'throws an error if it cannot read the misc tips file' do
      expect { tips_selector3 }.to raise_error(Errno::ENOENT)
    end
  end

  describe '#select_tip' do
    before do
      srand(seed)
    end

    it 'throws an error if it cannot read the previous tips file' do
      expect { tips_selector2.select_tip(tips) }.to raise_error(Errno::ENOENT)
    end

    it 'selects a tip passed that is not in the waited tips file' do
      expect(tips_selector.select_tip(tips)).to eq tips[3]
    end

  end
end
