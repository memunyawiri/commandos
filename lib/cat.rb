# this class loads a file of tips for the cat command.
class Cat
  def initialize(filename = 'tips/cat.txt')
    load_tips(filename)
  end

  def tips
    @tips.dup
  end

  private

  def load_tips(filename)
    @tips = {}
    File.open(filename, 'r') do |file|
      file.readlines.each do |line|
        key, value = line.chomp.split(':', 2)
        @tips[key.to_sym] = value
      end
    end
  end
end
