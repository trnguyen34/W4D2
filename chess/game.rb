require_relative "display.rb"
class Game
    attr_reader :display
    def initialize
        @board = Board.new
        @display = Display.new(@board)
    end
end