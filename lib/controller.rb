# Collaborators here
require_relative 'printer'
require_relative 'tips_sanitiser'
require_relative 'tips_selector'

# Modules here
require_relative 'flags'
require_relative 'tips'

# Controller reads the history file, scans for commands and dispatches them to relevant classes
class Controller
  COMMANDS = %i[cat cd ls mkdir mv rm touch git].freeze

  def initialize(filename, instances = {}, sanitiser = nil, selector = nil, printer = nil)
    @filename = filename
    load_command_instances(instances)
    @sanitiser = sanitiser || TipsSanitiser.new
    @selector = selector || TipsSelector.new
    @printer = printer || Printer.new
    @tips = []
  end

  def scan_for_commands
    File.open(filename, 'r') do |file|
      file.readlines.each do |line|
        _id, command, arguments = extract_id_command_arguments(line)
        next unless COMMANDS.include?(command.to_sym)
        @tips << instances[command.to_sym].suggest_tips(arguments.to_s)
      end
    end
  end

  def sanitise
    @tips = sanitiser.sanitise(tips.flatten)
  end

  def select_tip
    @tip = selector.select_tip(tips)
  end

  def output(output_type)
    printer.output(tip, output_type)
    printer.add_to_waited_tips(tip)
  end

  private

  attr_reader :filename, :instances, :sanitiser, :selector, :printer, :tips, :tip

  def load_command_instances(instances)
    @instances = {}
    COMMANDS.each do |command|
      require_relative command.to_s
      @instances[command] = instances[command] || Object.const_get(command.capitalize).new
    end
  end

  def extract_id_command_arguments(line)
    id, rest = line.chomp.split('  ').reject { |part| part == '' }
    command, arguments = rest.to_s.split(' ', 2)
    [id, command, arguments]
  end
end
