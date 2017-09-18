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
    checks = %w[mv i f flags_order n v]
    tips = []
    checks.each do |check|
      tip = send("check_for_#{check}", options)
      tips << tip if tip
    end
    tips
  end

  def check_for_mv(_options)
    @tips[:mv]
  end

  def check_for_i(options)
    @tips[:i] unless options.include?('i')
  end

  def check_for_f(options)
    @tips[:f] unless options.include?('f')
  end

  def check_for_flags_order(options)
    @tips[:flags_order] unless options.include?('fi') &&
                               options.include?('fn') &&
                               options.include?('fv')
  end

  def check_for_n(options)
    @tips[:n] unless options.include?('n')
  end

  def check_for_v(options)
    @tips[:v] unless options.include?('v')
  end
end
