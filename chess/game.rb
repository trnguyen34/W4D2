require_relative "display.rb"
require 'byebug'
class Game
    attr_reader :display, :board
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end
end