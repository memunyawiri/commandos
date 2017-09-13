class Cd
  def initialize
    @tips = {
      hyphen: 'You can switch between 2 directories using cd -',
      tilde: 'Did you know that you return to your home directory using cd ~',
      forward_slash: 'Need to go to the very base of the file system? That’s what the forward slash is for: cd /'
    }
  end

  def suggest_tips(command)
    options = []
    command.split(/ /)[1..-1].each do |option|
      option.each_char do |char|
        options << char
      end
    end
    combine_tips(options)
  end

  private

  def combine_tips(options)
    [] << check_for_hyphen(options) << check_for_tilde(options) << check_for_forward_slash(options)
  end

  def check_for_hyphen(options)
    return @tips[:hyphen] unless options.include?("-")
  end

  def check_for_tilde(options)
    return @tips[:tilde] unless options.include?("~")
  end

  def check_for_forward_slash(options)
    return @tips[:forward_slash] unless options.include?("/")
  end
end
