class Commandos
  def initialize
    open_history_file
    scan_for_tips
  end

  def open_history_file
    @file = File.open("history.txt", "r")
  end

  def scan_for_tips
    file.readlines.each do |line|
      id, command = line.split(" ")
      case command
      when /ls/
        puts "ls -a would have shown you the hidden files as well."
      end
    end
  end

  private

  attr_accessor :file
end

Commandos.new
