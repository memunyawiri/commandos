# Cat class suggests tips for cat command
class Cat
  include Flags
  include Tips

  def initialize(filename = 'tips/cat.txt')
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
    [] << check_for_b(options) << check_for_n(options)
  end

  def check_for_b(options)
    return @tips[:b] unless options.include?('b')
  end

  def check_for_n(options)
    return @tips[:n] unless options.include?('n')
  end
end
