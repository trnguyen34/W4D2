require_relative 'slideable.rb'
class Piece
   def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
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

    attr_reader :color, :board
    attr_accessor :pos
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

class Pawn < Piece
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2659" : "\u265F"
    end

    def moves

    end

    
end