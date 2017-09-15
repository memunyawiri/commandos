require_relative 'flags'
# this class loads a file of tips for the cat command.
class Cat
  include Flags
  def initialize(filename = 'tips/cat.txt')
    load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(extract_flags(arguments))
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
