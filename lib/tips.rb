# Tips module returns a hash created from the tips in the file
module Tips
  def load_tips(filename)
    tips = {}
    File.open(filename, 'r') do |file|
      file.readlines.each do |line|
        key, value = line.chomp.split(':', 2)
        tips[key.to_sym] = value
      end
    end
    tips
  end
end
