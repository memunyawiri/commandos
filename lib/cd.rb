# Cd class suggests tips for cd command
class Cd
  include Tips

  def initialize(filename = 'tips/cd.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    tips.map { |key, value| value unless arguments.split(' ').include?(key.to_s) }
  end

  def tips
    @tips.dup
  end
end
