class Printer


  def output(tips, type_of_output)
    output_type_decider(tip_decider(tips), type_of_output)
  end

private

  def output_type_decider(tip, type_of_output)
    print_tips(tip) if type_of_output == :print
    write_tips_to_file(tip) if type_of_output == :file
    say_tips(tip) if type_of_output == :says
  end

  def tip_decider(tips)
    tips.first
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
