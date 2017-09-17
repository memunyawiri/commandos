# The Printer class delivers the tips to the user in the format that was requested.
class Printer
  def initialize(output_file = 'output.txt', waited_file = 'waited_tips.txt', wait_for_n = 10)
    @output_file = File.join(File.dirname(__FILE__), '../output/', output_file)
    @waited_file = File.join(File.dirname(__FILE__), '../output/', waited_file)
    @wait_for_n = wait_for_n
  end

  def output(tip, output_type)
    output_type = 'print' unless %w[print file speech].include?(output_type)
    send("tips_to_#{output_type}", tip)
  end

  def add_to_waited_tips(tip)
    file = File.open(waited_file, 'r')
    waited_tips = file.readlines.each_with_object([]) { |line, array| array << line.chomp }
    waited_tips << tip
    waited_tips.shift if waited_tips.count > wait_for_n
    File.open(waited_file, 'w') { |file| waited_tips.each { |line| file.puts line } }
  end

  private

  attr_reader :output_file, :waited_file, :wait_for_n

  def tips_to_print(tip)
    puts "\e[32m#{tip}\e[0m"
  end

  def tips_to_file(tip)
    File.open(output_file, 'w') do |file|
      file.puts tip
    end
  end

  def tips_to_speech(tip)
    system 'say', tip
  end
end
