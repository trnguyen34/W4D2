require_relative "piece.rb"
require 'singleton'

class NullPiece < Piece
    include Singleton
    def initialize
        @symbol = " "
        super(nil, nil, [nil, nil])
    end

    def empty?
        true
    end

    def moves
        
    end
end