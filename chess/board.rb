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
        curr_piece = self[start_pos]
        if curr_piece == null_piece
            raise "There is no peice at the given position"
        else
            self[end_pos] = curr_piece
            curr_piece.pos = end_pos
            self[start_pos] = null_piece
        end
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end
        
    private
    attr_reader :null_piece
end

if __FILE__ == $PROGRAM_NAME
    board1 = Board.new
    #puts board1[[2, 3]]
    p1 = Piece.new(:white, board1, [3,3])
    board1.add_piece(p1, p1.pos)
    puts board1[[3, 3]]
    board1.move_piece(p1.pos, [4, 4])
    puts board1[[3, 3]]
    puts board1[[4, 4]]
    

end