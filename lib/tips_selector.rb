class TipsSelector
  def initialize(waited_file = 'waited_tips.txt')
    @waited_file = File.join(File.dirname(__FILE__), '../output/', waited_file)
  end

  def select_tip(tips)
    load_waited_tips
    random_non_waited_tip(tips)
  end

  private

  attr_reader :waited_file, :waited_tips

  def load_waited_tips
    @waited_tips = []
    File.open(waited_file, 'r') do |file|
      file.readlines.each do |line|
        @waited_tips << line.chomp
      end
    end
  end

  def random_non_waited_tip(tips)
    (tips - waited_tips).sample
  end
end
