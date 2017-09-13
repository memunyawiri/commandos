class Ls
  def initialize
    @tips = {
      a: '-a would give you hidden files as well',
      l: '-l would give you more information about your files',
      la: 'Did you know, you can also run “ls -la” to get more information about your ALL your files!',
      lt: '-lt gives you a list of files sorted by time modified :-)'
    }
  end

  def suggest_tips(command)
    options = [command.split(/-/).last]
    command.split(/-/)[1..-1].each do |option|
      option.each_char do |char|
        puts char
        options << char
      end
    end
    combine_all_useful_tips(options)
  end

  private

  def combine_all_useful_tips(options)
    [] << check_for_a(options) << check_for_l(options) << check_for_la(options) << check_for_lt(options)
  end

  def check_for_lt(options)
    return @tips[:lt] unless options.include?('lt')
  end

  def check_for_la(options)
    return @tips[:la] unless options.include?("la")
  end

  def check_for_l(options)
    return @tips[:l] unless options.include?("l")
  end

  def check_for_a(options)
    return @tips[:a] unless options.include?("a")
  end
end
