# Mv class suggests tips for mv command
class Mv
  include Flags
  include Tips
  def initialize(filename = 'tips/mv.txt')
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
