# frozen_string_literal: true

require_relative 'knights_travails/app'
require_relative 'knights_travails/queue'
require_relative 'knights_travails/node'
require_relative 'knights_travails/visited'
require_relative 'knights_travails/bfs'
require_relative 'knights_travails/position'
require_relative 'knights_travails/position_coding'
require_relative 'knights_travails/piece'
require_relative 'knights_travails/knight'
require_relative 'knights_travails/board'

# namespace for the project.
module KnightsTravails
  def self.run(args)
    puts "File: #{__FILE__.split('/')[-1]}, Running method: #{__method__}"
    app = KnightsTravails::App.new
    app.run(args)
  end
end

# Start the program if this file is executed directly
KnightsTravails.run(ARGV)
