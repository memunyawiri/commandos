class Cd
  def initialize
    @tips = {
      hyphen: 'You can switch between 2 directories using cd -'
    }
  end

  def suggest_tips(command)
    options = []
    command.split(/ /)[1..-1].each do |option|
      option.each_char do |char|
        options << char
      end
    end
    [] << check_for_hyphen(options)
  end

  private

  def check_for_hyphen(options)
    return @tips[:hyphen] unless options.include?("-")
  end
end
