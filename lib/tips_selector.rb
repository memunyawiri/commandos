class TipsSelector
  def initialize(filename = 'output/past_tips.txt')
    @filename = File.join(File.dirname(__FILE__), '..', filename)
  end

  def select_tip(tips)
    load_past_tips
    random_waited_down_tip(tips)
  end

  private

  attr_reader :filename, :past_tips

  def load_past_tips
    @past_tips = []
    File.open(filename, 'r') do |file|
      file.readlines.each do |line|
        @past_tips << line.chomp
      end
    end
  end

  def random_waited_down_tip(tips)
    (tips - past_tips).sample
  end
end
