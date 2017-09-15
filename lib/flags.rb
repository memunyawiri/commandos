module Flags
  def extract_flags(arguments)
    flags = arguments.split(' ').select { |part| part[0] == '-'}
    flags.each_with_object([]) do |flag, individual_flags|
      flag.each_char do |char|
        individual_flags << char unless char == '-'
      end
    end
  end
end
