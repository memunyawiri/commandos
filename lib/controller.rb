# Controller reads the history file, scans for commands and dispatches them to relevant classes
class Controller
  def initialize(filename, instances = {})
    @file = File.open(filename, 'r')
    set_default_command_instances
    override_command_instances(instances)
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

  def set_default_command_instances
    @instances = {}
    [:ls].each do |command|
      require_relative command.to_s
      @instances[command] = Object.const_get(command.capitalize).new
    end
  end

  def override_command_instances(instances)
    instances.each do |key, value|
      @instances[key] = value
    end
  end

  def instance_for(command)
    @instances[command.split(' ')[0].to_sym]
  end
end
