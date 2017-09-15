require 'controller'

describe Controller do
  let!(:ls) { double(:ls, suggest_tips: []) }
  let!(:cd) { double(:cd, suggest_tips: []) }
  let!(:mv) { double(:mv, suggest_tips: []) }
  let!(:tips_sanitiser) { double(:tips_sanitiser, sanitise: []) }
  let!(:printer) { double(:printer, output: []) }
<<<<<<< Updated upstream
  let!(:instances) { { ls: ls, cd: cd } }
  subject(:controller) do
    described_class.new('history_test.txt', instances, tips_sanitiser, printer)
  end
=======
  let!(:instances) { { ls: ls, cd: cd, mv: mv } }
  subject(:controller) { described_class.new('history_test.txt', instances, tips_sanitiser, printer) }
>>>>>>> Stashed changes
  let!(:controller2) { described_class.new('nonexistent_history.txt') }

  describe '#scan_for_commands' do
    it 'throws an error if the history file does not exist' do
      expect { controller2.scan_for_commands }.to raise_error(Errno::ENOENT)
    end

    it 'can find ls command' do
      expect(ls).to receive(:suggest_tips).with('-la')
      controller.scan_for_commands
    end

    it 'can find cd command' do
      expect(cd).to receive(:suggest_tips).with('ruby-kickstart')
      controller.scan_for_commands
    end

    it 'can find mv command' do
      expect(mv).to receive(:suggest_tips).with('filename.txt newfilename.txt')
      controller.scan_for_commands
    end
  end

  describe '#sanitise' do
    it 'calls the sanitise method of tips_sanitiser' do
      expect(tips_sanitiser).to receive(:sanitise).with(Array)
      controller.sanitise
    end
  end

  describe '#output' do
    it 'it calls the output method' do
      expect(printer).to receive(:output)
      controller.output('print')
    end
  end
end
