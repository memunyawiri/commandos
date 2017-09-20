# TipsSelector selects a tip that is not in the waited_file
class TipsSelector
  include Tips
  def initialize(waited_file = 'waited_tips.txt', misc_file = 'tips/misc.txt')
    @waited_file = File.join(File.dirname(__FILE__), '../output/', waited_file)
    @misc_tips = load_tips(misc_file)
  end

  def select_tip(tips)
    @waited_tips = load_waited_tips(waited_file)
    tip = random_non_waited_tip(tips)
    tip ? tip : random_non_waited_tip(misc_tips.values)
  end

  private

  attr_reader :waited_file, :waited_tips, :misc_tips

  def load_waited_tips(file_name)
    file = File.open(file_name, 'r')
    file.readlines.each_with_object([]) do |line, loaded_tips|
      loaded_tips << line.chomp
    end
  end

  def random_non_waited_tip(tips)
    (tips - waited_tips).sample
  end
end
