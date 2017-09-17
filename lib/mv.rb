# Mv class suggests tips for mv command
class Mv
  include Tips

  def initialize(filename = 'tips/mv.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(arguments)
  end

  def tips
    @tips.dup
  end

  private

  def combine_tips(options)
    [] << check_for_mv(options)
  end

  def check_for_mv(_options)
    @tips[:mv]
  end
end
