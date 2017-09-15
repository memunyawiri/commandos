require 'controller'

describe Controller do
  let!(:cat) { double(:cat, suggest_tips: []) }
  let!(:cd) { double(:cd, suggest_tips: []) }
  let!(:ls) { double(:ls, suggest_tips: []) }
  let!(:mkdir) { double(:mkdir, suggest_tips: []) }
  let!(:mv) { double(:mv, suggest_tips: []) }
  let!(:rm) { double(:mv, suggest_tips: []) }
  let!(:touch) { double(:touch, suggest_tips: []) }
  let!(:instances) { { cat: cat, cd: cd, ls: ls, mkdir: mkdir, mv: mv, rm: rm, touch: touch } }

  let!(:tips_sanitiser) { double(:tips_sanitiser, sanitise: []) }
  let!(:printer) { double(:printer, output: []) }

  subject(:controller) do
    described_class.new('history_test.txt', instances, tips_sanitiser, printer)
  end

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

    it 'can find cat command' do
      expect(cat).to receive(:suggest_tips).with('file_name.txt')
      controller.scan_for_commands
    end

    it 'can find mkdir command' do
      expect(mkdir).to receive(:suggest_tips).with('ruby-kickstart')
      controller.scan_for_commands
    end

    it 'can find touch command' do
      expect(touch).to receive(:suggest_tips).with('ruby-kickstart')
      controller.scan_for_commands
    end

    it 'can find rm command' do
      expect(rm).to receive(:suggest_tips).with('file_name.txt')
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
