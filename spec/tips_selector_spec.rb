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

  let!(:tips2) do
    ['The command cat -n will print line numbers next to each line in a file.',
     'You can switch between 2 directories using cd -',
     'You can view more information about your files using ls -l',
     'You can open your current directory in finder with open .',
     'Use rm -i to be prompted for confirmation before attempting to remove each file']
  end

  let!(:seed) { 2300 }

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
      expect(tips_selector.select_tip(tips)).to eq tips[2]
    end

    it 'selects a tip from the misc file' do
      expected_tip = 'Press the up arrow to recall previous commands'
      expect(tips_selector.select_tip(tips2)).to eq expected_tip
    end
  end
end
