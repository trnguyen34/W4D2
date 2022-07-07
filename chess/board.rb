require_relative "piece.rb"
require_relative "nullpiece.rb"
class Board
    def initialize
        @null_piece = NullPiece.instance
        @rows = Array.new(8) {Array.new(8, null_piece)}

        self[[0,0]] = Rook.new(:W, self, [0, 0])
        self[[0,1]] = Knight.new(:W, self, [0, 1])
        self[[0,2]] = Bishop.new(:W, self, [0, 2])
        self[[0,3]] = King.new(:W, self, [0, 3])
        self[[0,4]] = Queen.new(:W, self, [0, 4])
        self[[0,5]] = Bishop.new(:W, self, [0, 5])
        self[[0,6]] = Knight.new(:W, self, [0, 6])
        self[[0,7]] = Rook.new(:W, self, [0, 7])
        self[[1,0]] = Pawn.new(:W, self, [1, 0])
        self[[1,1]] = Pawn.new(:W, self, [1, 1])
        self[[1,2]] = Pawn.new(:W, self, [1, 2])
        self[[1,3]] = Pawn.new(:W, self, [1, 3])
        self[[1,4]] = Pawn.new(:W, self, [1, 4])
        self[[1,5]] = Pawn.new(:W, self, [1, 5])
        self[[1,6]] = Pawn.new(:W, self, [1, 6])
        self[[1,7]] = Pawn.new(:W, self, [1, 7])

        self[[7,0]] = Rook.new(:B, self, [7, 0])
        self[[7,1]] = Knight.new(:B, self, [7, 1])
        self[[7,2]] = Bishop.new(:B, self, [7, 2])
        self[[7,3]] = King.new(:B, self, [7, 3])
        self[[7,4]] = Queen.new(:B, self, [7, 4])
        self[[7,5]] = Bishop.new(:B, self, [7, 5])
        self[[7,6]] = Knight.new(:B, self, [7, 6])
        self[[7,7]] = Rook.new(:B, self, [0, 7])
        self[[6,0]] = Pawn.new(:B, self, [6, 0])
        self[[6,1]] = Pawn.new(:B, self, [6, 1])
        self[[6,2]] = Pawn.new(:B, self, [6, 2])
        self[[6,3]] = Pawn.new(:B, self, [6, 3])
        self[[6,4]] = Pawn.new(:B, self, [6, 4])
        self[[6,5]] = Pawn.new(:B, self, [6, 5])
        self[[6,6]] = Pawn.new(:B, self, [6, 6])
        self[[6,7]] = Pawn.new(:B, self, [6, 7])
    end

    def [](pos)
        @rows[pos[0]][pos[1]]
    end

    def []=(pos, val)
        @rows[pos[0]][pos[1]] = val
    end

    def move_piece(color, start_pos, end_pos)
        curr_piece = self[start_pos]
        if curr_piece == null_piece
            raise "There is no peice at the given position"
        elsif(color != curr_piece.color)
            raise "This piece is the wrong color"
        else
            self[end_pos] = curr_piece
            curr_piece.pos = end_pos
            self[start_pos] = null_piece
        end
    end

    def add_piece(piece, pos)
        self[pos] = piece
    end

    def self.on_board?(pos)
        pos[0].between?(0,7) && pos[1].between?(0,7)
    end

    

    def find_king(color)
        piece_list = generate_piece_list(color)
        king = piece_list.find {|piece| piece.class == King}
        king.pos
    end

    def in_check?(color)

        kingpos = find_king(color)

        enemy = color == :W ? :B : :W

        enemy_list = generate_piece_list(enemy)

        enemypawns = enemy_list.select {|enemy| enemy.class = Pawn}
        enemyother = enemy_list.select {|enemy| enemy.class != Pawn}

        enemymoves = enemyother.inject([]) {|acc, curr| acc + curr.moves}

        return true if enemymoves.include?(kingpos)

        return true if enemypawns.any? {|pawn| pawn.attackableposition?(kingpos)}

        false
=begin
Find the king of requested color 
Check all of opposing non pawn pieces and see if any of their moves is the position of the requested king.
If true, return true

Else
Also check the opposing pawn's attack positions only (not the forward ones). If any of them lands on
the king's position, return true

Else return false
=end
    end

    def checkmate?(color)
=begin
First, make sure it is in check.

Iterate through all of your color's pieces' moves. Change the duplicate board to reflect each move
If all of these boards are still in check, then return true
    else, return false
=end
    end

    private


    def generate_piece_list(color)

        rawlist = @rows.flatten # this is all pieces including null pieces

        rawlist.select {|piece| piece.color == color}
    end
    attr_reader :null_piece
end

if __FILE__ == $PROGRAM_NAME
    board1 = Board.new
    #puts board1[[2, 3]]
    p1 = Piece.new(:W, board1, [3,3])
    board1.add_piece(p1, p1.pos)
    puts board1[[3, 3]]
    board1.move_piece(:W, p1.pos, [4, 4])
    puts board1[[3, 3]]
    puts board1[[4, 4]]
    

end