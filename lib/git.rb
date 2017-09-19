# Git class suggests tips for cd command
class Git
  include Tips
  include Flags
  def initialize(filename = 'tips/git.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(_arguments)
    @tips.values
  end

  def tips
    @tips.dup
  end
end
