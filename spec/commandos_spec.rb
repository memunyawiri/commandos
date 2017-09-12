require 'commandos'

describe Commandos do
  subject(:commandos) { described_class.new("history.txt") }

  describe 'initialisation' do
    it 'throws an error if the history file does not exist' do
      expect { Commandos.new("nonexistent_history.txt") }.to raise_error(Errno::ENOENT)
    end
  end

  describe 'scan for commands' do
    before do
      commandos = Commandos.new("history_test.txt")
    end

    it 'can find ls command' do
      expect { commandos.scan_for_commands }.to output(/Found ls/).to_stdout
    end
  end

end
