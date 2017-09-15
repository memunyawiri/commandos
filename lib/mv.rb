# Mv class suggests tips for mv command
class Mv
  def initialize(filename = 'tips/mv.txt')
    load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(arguments)
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
    [] << check_for_mv(options)
  end

  def check_for_mv(_options)
    @tips[:mv]
  end
end
