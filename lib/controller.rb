require_relative 'ls'

class Controller
  def initialize(filename, instances = Hash.new)
    @filename = filename
    @ls = instances[:ls] || Ls.new
    open_history_file
  end

  def open_history_file
    @file = File.open(filename, "r")
  end

  def scan_for_commands
    file.readlines.each do |line|
      id, command = line.chomp.split(/  /).reject { |part| part == ""}
      case command
      when /ls/
        ls.suggest_tips(command)
      end
    end
  end

  private

  attr_reader :filename, :file, :ls
end
