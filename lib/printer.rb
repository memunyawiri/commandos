# The Printer class delivers the tips to the user in the format that was requested.
class Printer
  def initialize(output_file = 'output.txt', waited_file = 'waited_tips.txt')
    @output_file = File.join(File.dirname(__FILE__), '../output/', output_file)
    @waited_file = File.join(File.dirname(__FILE__), '../output/', waited_file)
  end

  def output(tip, output_type)
    output_type = 'print' unless %w[print file speech].include?(output_type)
    send("tips_to_#{output_type}", tip)
  end

  def add_to_waited_tips(tip)
    File.open(@waited_file, 'a') do |file|
      file.puts tip
    end
  end

  private

  def tips_to_print(tip)
    puts tip
  end

  def tips_to_file(tip)
    File.open(@output_file, 'w') do |file|
      file.puts tip
    end
  end

  def tips_to_speech(tip)
    system 'say', tip
  end
end
