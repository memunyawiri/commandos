# Mkdir class suggests tips for mkdir command
class Mkdir
  include Tips
  include Flags

  def initialize(filename = 'tips/mkdir.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    # tips.values
    non_flags = arguments.split(' ').reject { |part| part[0] == '-'}
    flags = extract_flags(arguments)
    tips.map { |key, value| value unless (flags + non_flags).include?(key.to_s) }
  end

  def tips
    @tips.dup
  end
end
