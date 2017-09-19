require 'controller'

describe Controller do
  let!(:cat) { double(:cat, suggest_tips: []) }
  let!(:cd) { double(:cd, suggest_tips: []) }
  let!(:ls) { double(:ls, suggest_tips: []) }
  let!(:mkdir) { double(:mkdir, suggest_tips: []) }
  let!(:mv) { double(:mv, suggest_tips: []) }
  let!(:rm) { double(:mv, suggest_tips: []) }
  let!(:touch) { double(:touch, suggest_tips: []) }
  let!(:git) { double(:git, suggest_tips: []) }
  let!(:instances) do
    { cat: cat, cd: cd, git: git, ls: ls, mkdir: mkdir, mv: mv, rm: rm,
      touch: touch }
  end

  let!(:tips_sanitiser) { double(:tips_sanitiser, sanitise: ['tip one', 'tip two']) }
  let!(:tips_selector) { double(:tips_selector, select_tip: 'tip two') }
  let!(:printer) { double(:printer, output: nil, add_to_waited_tips: nil) }

  subject(:controller) do
    described_class.new('history_test.txt', instances, tips_sanitiser, tips_selector, printer)
  end

  let!(:controller2) { described_class.new('nonexistent_history.txt') }

  describe '#scan_for_commands' do
    it 'throws an error if the history file does not exist' do
      expect { controller2.scan_for_commands }.to raise_error(Errno::ENOENT)
    end

    it 'can find git command' do
      expect(git).to receive(:suggest_tips).with('branch')
      controller.scan_for_commands
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

  describe '#select_tip' do
    it 'calls the select_tip method of tips_selector' do
      controller.sanitise
      expect(tips_selector).to receive(:select_tip).with(['tip one', 'tip two'])
      controller.select_tip
    end
  end

  describe '#output' do
    it 'calls the output method of printer' do
      controller.select_tip
      expect(printer).to receive(:output).with('tip two', 'print')
      controller.output('print')
    end

    it 'calls the add_to_waited_tips method of printer' do
      controller.select_tip
      expect(printer).to receive(:add_to_waited_tips).with('tip two')
      controller.output('print')
    end
  end
end
