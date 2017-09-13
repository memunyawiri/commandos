# Controller reads the history file, scans for commands and dispatches them to relevant classes
class Controller
  def initialize(filename, instances = {})
    @file = File.open(filename, 'r')
    initialize_command_instances(instances)
  end

  def scan_for_commands
    file.readlines.each do |line|
      _id, command = line.chomp.split('  ').reject { |part| part == '' }
      command_instance = instance_for(command)
      command_instance.suggest_tips(command) if command_instance
    end
  end

  private

  attr_reader :file

  def initialize_command_instances(instances)
    @instances = {}
    instances.each do |key, value|
      require_relative key.to_s
      @instances[key] = value || Object.const_get(key.capitalize).new
    end
  end

  def instance_for(command)
    @instances[command.split(' ')[0].to_sym]
  end
end
