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
=begin

        Iterate through move_dirs

        inject starting wiht empty array, pass each vector from move_dir into grow_un...
        and add it to the empty array


=end
        move_dirs.inject([]) {|acc, curr| acc + grow_unblocked_moves_in_dir(*curr)}
        
    end

    def move_dirs
        []

    end

    def grow_unblocked_moves_in_dir(dx, dy)
        # debugger

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
=begin
Start with curren position and iterate by adding dx, dy to position
        Stop if you move out of the board

        If you hit a piece:
            If it's an enemy, add this last position
            Break
        Else if it's a friendly one
            Don´t add this last position
            Break
        Else
            Add the position
        End

=end

    end
end