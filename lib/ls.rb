# Ls class suggests tips for ls command
class Ls
  def initialize
    @tips = {
      a: '-a would give you hidden files as well',
      l: '-l would give you more information about your files',
      t: '-t gives you a list of files sorted by time modified :-)'
    }
  end

  def suggest_tips(command)
    options = []
    command.split(/-/)[1..-1].each do |option|
      option.each_char do |char|
        options << char
      end
    end
    combine_all_useful_tips(options)
  end

  private

  def combine_all_useful_tips(options)
    [] << check_for_a(options) << check_for_l(options) << check_for_t(options)
  end

  def check_for_t(options)
    return @tips[:t] unless options.include?('t')
  end

  def check_for_l(options)
    return @tips[:l] unless options.include?("l")
  end

  def check_for_a(options)
    return @tips[:a] unless options.include?('a')
  end
end
