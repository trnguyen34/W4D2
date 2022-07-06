require_relative "board.rb"
require_relative "cursor.rb"
class Display
    def initialize(board)
        @board = board
        @cursor = Cursor.new([0, 0], board)
    end

    def render
        system("clear")
        (0..7).each do |i|
            puts (0..7).map { |j| [i, j] != @cursor.cursor_pos ? @board[[i, j]].to_s : @board[[i, j]].to_s.blue.on_green}.join(' ')
        end    
            
    end

    def navigate
        while(true)
            render
            @cursor.get_input
        end
    rescue SystemExit
        puts "over"
    end

end