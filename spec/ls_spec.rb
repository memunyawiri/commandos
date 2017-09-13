require 'ls'

describe Ls do
  subject(:ls) { described_class.new }
  let!(:tip_a) { "-a would give you hidden files as well" }

  describe '#suggest_tips' do
    it 'can suggest using -a option when it is not used' do
      expect(ls.suggest_tips("ls -l").include?(tip_a)).to be true
    end

    it 'does not suggest using -a option when already used in an individual format' do
      expect(ls.suggest_tips("ls -l -a").include?(tip_a)).to be false
    end

    it 'does not suggest using -a option when already used in a combined format' do
      expect(ls.suggest_tips("ls -la").include?(tip_a)).to be false
    end
  end
end
