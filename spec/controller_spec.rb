require 'controller'

describe Controller do
  let!(:ls) { double(:ls, suggest_tips: []) }
  let!(:cd) { double(:cd, suggest_tips: []) }
  let!(:tips_santiser) { double(:tips_santiser, sanitise: []) }
  let!(:instances) { { ls: ls, cd: cd } }
  subject(:controller) { described_class.new('history_test.txt', instances, tips_santiser) }

  describe 'initialisation' do
    it 'throws an error if the history file does not exist' do
      expect { Controller.new('nonexistent_history.txt') }.to raise_error(Errno::ENOENT)
    end
  end

  describe 'scan for commands' do
    it 'can find ls command' do
      expect(ls).to receive(:suggest_tips).with('-la')
      controller.scan_for_commands
    end

    it 'can find cd command' do
      expect(cd).to receive(:suggest_tips).with('ruby-kickstart')
      controller.scan_for_commands
    end
  end

  describe '#sanitise' do
    it 'it calls the sanitise method' do
      expect(tips_santiser).to receive(:sanitise)
      controller.sanitise
    end
  end
end
