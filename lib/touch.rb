# Touch class suggests tips for touch command
class Touch
  include Tips

  def initialize(filename = 'tips/touch.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(_arguments)
    @tips[:rm]
  end

  def tips
    @tips.dup
  end
end
