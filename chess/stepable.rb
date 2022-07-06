module Stepable
    def moves 
       moveable_postions = move_diffs.map { |diff| addpos(pos, diff)}
       moveable_postions.select { |position| Board.on_board?(position) && 
                                    board[position].color != color}
    end

    #private
    def move_diffs
        []
    end
end