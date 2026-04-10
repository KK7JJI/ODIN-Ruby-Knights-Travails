# frozen_string_literal: true

require_relative 'knights_travails/app'

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
