require 'commandos'

describe Commandos do
  subject(:commandos) {described_class.new}
  describe 'intialisation' do

    before do
      prepare_for_inialisation_test
    end
    it 'creates a screen.log' do
      expect( File.exist?("screen.log") ).to be(true)
    end
  end

  def prepare_for_inialisation_test
    File.delete("screen.log") if(File.exist?("screen.log"))
    commandos
    sleep 1
  end
end
