# Controller reads the history file, scans for commands and dispatches them to relevant classes
class Controller
  COMMANDS = %i[ls cd].freeze

  def initialize(filename, instances = {})
    @file = File.open(filename, 'r')
    load_command_instances(instances)
  end

  def scan_for_commands
    file.readlines.each do |line|
      _id, command, arguments = extract_id_command_arguments(line)
      next unless COMMANDS.include?(command.to_sym)
      @instances[command.to_sym].suggest_tips(arguments.to_s)
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

  def extract_id_command_arguments(line)
    id, rest = line.chomp.split('  ').reject { |part| part == '' }
    command, arguments = rest.split(' ', 2)
    [id, command, arguments]
  end
end
