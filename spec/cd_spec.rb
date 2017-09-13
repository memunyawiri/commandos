require 'cd'

describe Cd do
  subject(:cd) { described_class.new }
  let!(:tip_hyphen) { "You can switch between 2 directories using cd -" }

  describe '#suggest_tips' do
    it 'suggest using the hyphen when it is not used' do
      expect(cd.suggest_tips("cd").include?(tip_hyphen)).to be true
    end

    it 'does not suggest using the hyphen option when already used in an individual format' do
      expect(cd.suggest_tips("cd -").include?(tip_hyphen)).to be false
    end
  end
end
