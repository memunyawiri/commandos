require 'commandos'

describe Commandos do
  subject(:commandos) { described_class.new("history.txt") }

  describe 'initialisation' do
    it 'throws an error if the history file does not exist' do
      expect { Commandos.new("nonexistent_history.txt") }.to raise_error(Errno::ENOENT)
    end
  end

end
