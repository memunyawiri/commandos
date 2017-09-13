# Ls class suggests tips for ls command
class Ls
  def initialize
    @tips = {
      a: '-a would give you hidden files as well'
    }
  end

  def suggest_tips(command)
    options = []
    command.split(/-/)[1..-1].each do |option|
      option.each_char do |char|
        options << char
      end
    end
    [] << check_for_a(options)
  end

  private

  def check_for_a(options)
    return @tips[:a] unless options.include?('a')
  end
end
