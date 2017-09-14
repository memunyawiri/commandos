require 'printer'

describe Printer do
  subject(:printer) { described_class.new }
  let!(:tips) do
    ['-a gives you hidden files as well',
     'You can switch between 2 directories using cd -']
  end
  let!(:seed) { 2400 }

  describe 'output' do
    before do
      srand(seed)
    end

    it 'prints the tip(s) when output type is print' do
      expect { printer.output(tips, 'print') }.to output("#{tips[1]}\n").to_stdout
    end

    it 'writes the tip(s) to the file when output type is file' do
      printer.output(tips, 'file')
      expect('output.txt').to have_file_content tips[1]
    end

    it 'speaks the tip(s) when output type is speech' do
      expect { printer.output(tips, 'speech') }.not_to raise_error # needs changing
    end

    it 'prints the tip(s) when output type is not print/file/speech' do
      expect { printer.output(tips, 'gobbledygook') }.to output("#{tips[1]}\n").to_stdout
    end
  end
end
