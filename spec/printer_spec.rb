require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let!(:tips_array) { [tip_a, tip_l, tip_t] }
  let!(:tip_a) { '-a would give you hidden files as well' }
  let!(:tip_l) { '-l would give you more information about your files' }
  let!(:tip_t) { '-t gives you a list of files sorted by time modified :-)' }



  describe "output" do
    it 'puts the tip in pretty way' do
      expect { printer.output(tips_array, :print) }.to output(tip_a).to_stdout
    end

    it 'prints a tip to a file' do
      printer.output(tips_array, :file)
       expect(exist?("output.txt")).to be true
    end

    #


  end

end
