class Git
  include Tips
  include Flags
  def initialize(filename = 'tips/git.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    combined_tips(arguments.split(' '))
  end

  def tips
    @tips.dup
  end

  private

  def combined_tips(options)
    [check_for_branch(options), check_for_log(options)]
  end

  def check_for_branch(options)
    return @tips[:branch] if options.include?('branch') && !options.include?('-r')
  end

  def check_for_log(options)
    return @tips[:log] unless options.include?('log')
  end

end
