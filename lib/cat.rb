# this class loads a file of tips for the cat command.
class Cat
  def initialize(filename = 'tips/cat.txt')
    load_tips(filename)
  end

  def suggest_tips(arguments)
    options = []
    arguments = arguments.gsub(/\s\w+\.txt|.md/, " ")
    arguments.split('-').each do |option|
      option.each_char do |char|
        p char
        options << char
      end
    end
    combine_tips(options)
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

  def combine_tips(options)
    [] << check_for_b(options) << check_for_n(options)
  end

  def check_for_b(options)
    return @tips[:b] unless options.include?('b')
  end

  def check_for_n(options)
    return @tips[:n] unless options.include?('n')
  end
end
