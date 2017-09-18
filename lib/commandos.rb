require_relative 'controller'

filename = ARGV[0] || 'history.txt'
output_type = ARGV[1] || 'print'
controller = Controller.new(filename)

controller.scan_for_commands
controller.sanitise
controller.select_tip
controller.output(output_type)
