class Git
  include Tips
  def initialize(filename = 'tips/git.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(_arguments)
    [@tips[:branch], @tips[:log]]
  end

  def tips
    @tips.dup
  end
end
