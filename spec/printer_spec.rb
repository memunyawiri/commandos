require 'printer'
describe Printer do
  subject(:printer) { described_class.new }
  let(:expected_string) {"You can switch between 2 directories using cd -"}

  describe "standard_output" do
    it 'puts the tip in pretty way' do
      expect { printer.standard_output }.to output(expected_string).to_stdout
    end
  end
end
