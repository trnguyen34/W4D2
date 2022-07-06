require_relative "board.rb"
require_relative "cursor.rb"
class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        (0..7).each do |i|
            p (0..7).map {|j| @board[[i, j]].to_s}.join(' ')
        end    
            
    end

    def navigate
    
    rescue SystemExit
        puts "over"
    end

end