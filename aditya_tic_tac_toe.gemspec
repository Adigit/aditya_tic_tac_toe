# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'aditya_tic_tac_toe/version'

Gem::Specification.new do |spec|
  spec.name          = "aditya_tic_tac_toe"
  spec.version       = AdityaTicTacToe::VERSION
  spec.authors       = ["Aditya"]
  spec.email         = ["aditya"]
  spec.summary       = %q{Play the tic-tac-toe game in the Terminal.}
  spec.description   = %q{Play the tic-tac-toe game in the Terminal. Supports fields of any size, and can be played with up to 5 players.}
  spec.homepage      = ""
  spec.license       = "Aditya Self"

  spec.files         = Dir["README.md", "LICENSE", "lib/**/*.rb"]
  spec.executables   = ["aditya_tic-tac-toe"]
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "curses", "~> 1.0"
  spec.add_dependency "tty", "= 0.1.0"

  spec.add_development_dependency "bundler", "~> 1.6"
  spec.add_development_dependency "rake"
end


