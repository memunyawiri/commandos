# The Printer class delivers the tips to the user in the format that was requested.
class Printer

  def output(tips, type_of_output)
    output_type_decider(tip_decider(tips), type_of_output)
  end

private

  def output_type_decider(tip, type_of_output)
    case type_of_output
      when :print
        print_tips(tip)
      when :file
        write_tips_to_file(tip)
      when :says
        say_tips(tip)
      end
  end

  def tip_decider(tips)
    tips.sample
  end

  def print_tips(tip)
    print tip
  end

  def write_tips_to_file(tip)
    file = "output/output.txt"
    output_file = File.open(file, "w")
    output_file.puts tip
    output_file.close
  end

  def say_tips(tip)
    system "say", tip
  end

end
