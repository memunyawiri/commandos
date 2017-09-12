class Commandos
  def initialize(filename)
    @filename = filename
    open_history_file
  end

  def open_history_file
    File.open(filename, "r")
  end

  private

  attr_reader :filename
end
