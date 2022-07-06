require_relative "display.rb"
require 'byebug'
require 'colorize'
class Game
    attr_reader :display, :board
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end
end