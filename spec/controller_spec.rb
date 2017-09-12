require 'controller'

describe Controller do
  subject(:controller) { described_class.new("history_test.txt") }

  describe 'initialisation' do
    it 'throws an error if the history file does not exist' do
      expect { Controller.new("nonexistent_history.txt") }.to raise_error(Errno::ENOENT)
    end
  end

  describe 'scan for commands' do
    it 'can find ls command' do
      expect { controller.scan_for_commands }.to output(/Found ls/).to_stdout
    end
  end

end
