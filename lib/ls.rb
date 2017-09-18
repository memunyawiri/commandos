# Ls class suggests tips for ls command
class Ls
  include Flags
  include Tips

  def initialize(filename = 'tips/ls.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    flags = extract_flags(arguments)
    tips.map { |key, value| value unless flags.include?(key.to_s) }
  end

  def tips
    @tips.dup
  end
end
