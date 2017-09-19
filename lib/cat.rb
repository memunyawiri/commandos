# Cat class suggests tips for cat command
class Cat
  include Flags
  include Tips

  def initialize(filename = 'tips/cat.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    non_flags = arguments.split(' ').reject { |part| part[0] == '-' }
    flags = extract_flags(arguments)
    tips.map { |key, value| value unless (flags + non_flags).include?(key.to_s) }
  end

  def tips
    @tips.dup
  end
end
