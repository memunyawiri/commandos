# Ls class suggests tips for ls command
class Ls
  include Flags
  include Tips

  def initialize(filename = 'tips/ls.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(extract_flags(arguments))
  end

  def tips
    @tips.dup
  end

  private

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
