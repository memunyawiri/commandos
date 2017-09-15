# Mkdir class suggests tips for cd command
class Mkdir
  def initialize(filename = 'tips/mkdir.txt')
    load_tips(filename)
  end

  def suggest_tips(arguments)
    check_for_empty(arguments.strip)
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

  def check_for_empty(options)
    return @tips[:rmdir], @tips[:open]
  end
end
