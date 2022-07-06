require_relative "board.rb"
class Display
    def initialize(board)
        @board = board
    end

    def render
        (0..7).each do |i|
            p (0..7).map {|j| @board[[i, j]].to_s}.join(' ')
        end    
            
    end



end