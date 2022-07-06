module Slideable
    HORIZONTAL_DIRS = [[0, 1], [1, 0], [-1, 0], [0, -1]]
    DIAGONAL_DIRS = [[1, 1], [1, -1], [-1, -1], [-1, 1]]


    def horizontal_dir
        HORIZONTAL_DIRS
    end

    def diagonal_dir
        DIAGONAL_DIRS
    end

    def moves
        move_dirs.inject([]) {|acc, curr| acc + grow_unblocked_moves_in_dir(*curr)} 
    end

    private
    def move_dirs
        []
    end

    def grow_unblocked_moves_in_dir(dx, dy)
        step = [dx, dy]
        moves = []
        currpos = addpos(pos, step)

        while(Board.on_board?(currpos))
            return moves if(board[currpos].color == color)
            moves << currpos
            return moves if board[currpos].color == enemy
            currpos = addpos(currpos, step)
        end

        return moves
    end
end