require_relative 'slideable.rb'
class Piece
   def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
    @enemy = enemy_color


   end   
    
    def to_s
        # "Color: #{color}, Board: #{board}, Position: [#{pos[0]}, #{pos[1]}]"
        "#{self.symbol}"
    end

    def empty?
        false
    end

    def symbol
        @symbol
    end

    def valid_moves

    end

    def move_into_check?(end_pos)

    end



    attr_reader :color, :board, :enemy
    attr_accessor :pos


    # private

    def enemy_color
        return nil if color == nil
        color == :W ? :B : :W
    end
end

class King < Piece
    # include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2654" : "\u265A"
    end   

    protected
    def move_diffs
    [[-1, -1], [-1, 0], [-1, 1], [0, -1],
      [0, 1], [1, -1], [1, 0], [1, 1]]
    end
end

class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2655" : "\u265B"
    end

    protected
    def move_dirs
        horizontal_dir + diagonal_dir
    end
end

class Rook < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2656" : "\u265C"
    end

    protected
    def move_dirs
        horizontal_dir
    end
end

class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2657" : "\u265D"
    end

    protected
    def move_dirs
        diagonal_dir
    end
end

class Knight < Piece
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2658" : "\u265E"
    end
end

class Pawn < Piece # For us, white starts at 1 and moves up in index and black starts at 6 and moves down in index
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2659" : "\u265F"
        @startrow = color == :W ? 1 : 6
        # if(color == :W)
        #     @startrow = 1
        # else
        #     @startrow = 6
        # end

        forward_dir
    end

    def moves # returns an array of places a piece can move to
        forward_steps + side_attacks
    end

  #private
    def at_start_row?
    # startrow is 1 if it is white, and 6 if it is black
        pos[0] == startrow
    end

    def forward_dir
        @forward = color == :W ? 1 : -1
    end

    def forward_steps
        moves = []
        forward_step = [pos[0] + forward, pos[1]]
        moveable = Board.on_board?(forward_step) && board[forward_step].empty?
        moves << forward_step if moveable
        double_step = [pos[0] + (forward*2), pos[1]]
        if at_start_row? && moveable && board[double_step].empty?
            moves << double_step
        end

        moves
    end

    def side_attacks
        moves = []
        attack1 = [pos[0] + forward, pos[1] + 1]
        attack2 = [pos[0] + forward, pos[1] - 1]
        moves << attack1 if Board.on_board?(attack1) && board[attack1].color == enemy
        moves << attack2 if Board.on_board?(attack2) && board[attack2].color == enemy
        moves
    end

    def pawn_enemy 
        enemy
    end

    attr_reader :startrow, :forward
    
end