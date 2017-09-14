require_relative 'controller'

filename = ARGV[0] || 'history.txt'
controller = Controller.new(filename)
controller.scan_for_commands
controller.sanitise
