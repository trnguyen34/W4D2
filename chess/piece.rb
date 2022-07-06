class Piece
   def initialize(color, board, pos)
    @color = color
    @board = board
    @pos = pos
   end   
    
    def to_s
        "Color: #{color}, Board: #{board}, Position: [#{pos[0]}, #{pos[1]}]"
    end

    def empty?
    end
    attr_reader :color, :board
    attr_accessor :pos
end