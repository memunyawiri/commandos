# Tips module returns a hash created from the tips in the file
module Tips
  def load_tips(filename)
    tips_file = File.join(File.dirname(__FILE__), '..', filename)
    file = File.open(tips_file, 'r')
    file.readlines.each_with_object({}) do |line, tips|
      key, value = line.chomp.split(':', 2)
      tips[key.to_sym] = value
    end
  end
end
