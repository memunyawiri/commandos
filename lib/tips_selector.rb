# TipsSelector selects a tip that is not in the waited_file
class TipsSelector
  def initialize(waited_file = 'waited_tips.txt')
    @waited_file = File.join(File.dirname(__FILE__), '../output/', waited_file)
  end

  def select_tip(tips)
    @waited_tips = load_tips(waited_file)
    random_non_waited_tip(tips)
  end

  private

  attr_reader :waited_file, :waited_tips

  def load_tips(file_name)
    file = File.open(file_name, 'r')
    file.readlines.each_with_object([]) do |line, loaded_tips|
      loaded_tips << line.chomp
    end
  end

  def random_non_waited_tip(tips)
    (tips - waited_tips).sample
  end
end
