require_relative 'controller'
require_relative 'printer'

filename = ARGV[0] || 'history.txt'
output_type = ARGV[1] || 'print'
controller = Controller.new(filename)

controller.scan_for_commands
controller.sanitise
controller.output(output_type)
