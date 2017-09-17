
# Mv class suggests tips for mv command
class Mv
  include Flags
  include Tips
  def initialize(filename = 'tips/mv.txt')
    @tips = load_tips(filename)
  end

  def suggest_tips(arguments)
    combine_tips(extract_flags(arguments))
  end

  def tips
    @tips.dup
  end

  private

  def combine_tips(options)
    [] << check_for_mv(options) << check_for_i(options) <<
      check_for_f(options) << check_for_flags_order(options)
  end

  def check_for_mv(options)
    @tips[:mv]
  end

  def check_for_i(options)
    @tips[:i] unless options.include?('i')
  end

  def check_for_f(options)
    @tips[:f] unless options.include?('f')
  end

  def check_for_flags_order(options)
    @tips[:flags_order] unless options.include?('if') && options.include?('fn') && options.include?('fv')
  end

end
