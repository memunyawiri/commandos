# Mkdir class suggests tips for mkdir command
class Mkdir
  include Tips

  def initialize(filename = 'tips/mkdir.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(_arguments)
    tips.values
  end

  def tips
    @tips.dup
  end
end
