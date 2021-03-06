require "optparse"

options = {}

opt_parser = OptionParser.new do |opts|
  opts.banner = <<-EOS
USAGE: tic-tac-toe [options]
Moving: Arrow keys or h/j/k/l
Placing symbol: <Space>
Exit: Ctrl-C
  EOS

  opts.on("-n", "--size N", "Size of the board (default: 3)") do |n|
    options[:size] = Integer(n)
  end

  opts.on("-p", "--players N", "The number of players (default: 2, max: 5)") do |n|
    options[:number_of_players] = Integer(n)
  end

  opts.on("-g", "--goal N", "The number symbols in a row is required (default: 3)") do |n|
    options[:goal] = Integer(n)
  end
end

opt_parser.parse!(ARGV)

require "tic_tac_toe"

TicTacToe.new(options).start