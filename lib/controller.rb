# Controller reads the history file, scans for commands and dispatches them to relevant classes
class Controller
  COMMANDS = [:ls].freeze

  def initialize(filename, instances = {})
    @file = File.open(filename, 'r')
    load_command_instances(instances)
  end

  def scan_for_commands
    file.readlines.each do |line|
      _id, rest = line.chomp.split('  ').reject { |part| part == '' }
      command, _options = rest.split(' ', 2)
      next unless COMMANDS.include?(command.to_sym)
      @instances[command.to_sym].suggest_tips(rest)
    end
  end

  private

  attr_reader :file

  def load_command_instances(instances)
    @instances = {}
    COMMANDS.each do |command|
      require_relative command.to_s
      @instances[command] = instances[command] || Object.const_get(command.capitalize).new
    end
  end
end
