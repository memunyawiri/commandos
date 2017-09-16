require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let!(:tip) { 'You can switch between 2 directories using cd -' }

  describe 'output' do
    it 'prints the tip when output type is print' do
      expect { printer.output(tip, 'print') }.to output("#{tip}\n").to_stdout
    end

    it 'writes the tip to the file when output type is file' do
      printer.output(tip, 'file')
      expect('output.txt').to have_file_content tip
    end

    # it 'speaks the tip when output type is speech' do
    #   expect { printer.output(tip, 'speech') }.not_to raise_error # needs changing
    # end

    it 'prints the tip when output type is not print/file/speech' do
      expect { printer.output(tip, 'gobbledygook') }.to output("#{tip}\n").to_stdout
    end
  end
end
