require_relative 'controller'
p ARGV[1]
filename = ARGV[0] || 'history.txt'
controller = Controller.new(filename)
controller.scan_for_commands
controller.sanitise
