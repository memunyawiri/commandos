require 'controller'

describe Controller do
  let! (:ls) { double(:ls) }
  let! (:instances) { { ls: ls }  }
  subject(:controller) { described_class.new("history_test.txt", instances) }

  describe 'initialisation' do
    it 'throws an error if the history file does not exist' do
      expect { Controller.new("nonexistent_history.txt") }.to raise_error(Errno::ENOENT)
    end
  end

  describe 'scan for commands' do
    it 'can find ls command' do
      expect(ls).to receive(:suggest_tips).with("ls -la")
      controller.scan_for_commands
    end
  end

end
