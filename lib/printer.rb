# The Printer class delivers the tips to the user in the format that was requested.
class Printer
  def initialize(filename = 'output/output.txt')
    @filename = filename
  end

  def output(tip, output_type)
    output_type = 'print' unless %w[print file speech].include?(output_type)
    send("tips_to_#{output_type}", tip)
  end

  private

  def tips_to_print(tip)
    puts tip
  end

  def tips_to_file(tip)
    File.open(@filename, 'w') do |output_file|
      output_file.puts tip
    end
  end

  def tips_to_speech(tip)
    system 'say', tip
  end
end
