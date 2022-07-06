require_relative "piece.rb"
require_relative "nullpiece.rb"
class Board
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8, null_piece)}
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def move_piece(start_pos, end_pos)
        

    end
    private
    attr_reader :null_piece
end

if __FILE__ == $PROGRAM_NAME
    board1 = Board.new
    puts board1[[2, 3]]

end