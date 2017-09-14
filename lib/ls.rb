# Ls class suggests tips for ls command
class Ls
  def initialize(filename = 'tips/ls.txt')
    load_tips(filename)
  end

  def suggest_tips(arguments)
    options = []
    arguments.split('-').each do |option|
      option.each_char do |char|
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
    [] << check_for_a(options) << check_for_l(options) << check_for_t(options)
  end

  def check_for_t(options)
    return @tips[:t] unless options.include?('t')
  end

  def check_for_l(options)
    return @tips[:l] unless options.include?('l')
  end

  def check_for_a(options)
    return @tips[:a] unless options.include?('a')
  end
end
