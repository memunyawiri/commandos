# Cd class suggests tips for cd command
class Cd
  def initialize(filename = 'tips/cd.txt')
    load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(arguments.strip)
  end

  def tips
    @tips.dup
  end

  private

  def load_tips(filename)
    @tips = {}
    File.open(filename, 'r') do |file|
      file.readlines.each do |line|
        key, value = line.chomp.split(':', 2)
        @tips[key.to_sym] = value
      end
    end
  end

  def combine_tips(options)
    [check_for_hyphen(options),
     check_for_tilde_or_empty(options),
     check_for_forward_slash(options)]
  end

  def check_for_hyphen(options)
    return @tips[:hyphen] unless options == '-'
  end

  def check_for_tilde_or_empty(options)
    return @tips[:tilde_or_empty] unless options.empty? || options.include?('~')
  end

  def check_for_forward_slash(options)
    return @tips[:forward_slash] unless options == '/'
  end
end
