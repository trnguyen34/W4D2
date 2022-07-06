require_relative 'slideable.rb'
class Piece
   def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
   end   
    
    def to_s
        # "Color: #{color}, Board: #{board}, Position: [#{pos[0]}, #{pos[1]}]"
        self.symbol
    end

    def empty?
    end
    def symbol
        @symbol
    end

    def valid_moves
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
end

class Queen < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2655" : "\u265B"
    end
end

class Rook < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2656" : "\u265C"
    end
end

class Bishop < Piece
    include Slideable
    def initialize(color, board, pos)
        super
        @symbol = color == :W ? "\u2657" : "\u265D"
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
end