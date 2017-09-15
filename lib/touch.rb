# Touch class suggests tips for touch command
class Touch
  def initialize(filename = 'tips/touch.txt')
    load_tips(filename)
  end

  def suggest_tip(arguments)
    check_for_rm(arguments.strip)
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

  def check_for_rm(options)
    return @tips[:rm] unless options.empty? || options.include?('rm')
  end
end
