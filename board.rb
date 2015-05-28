require_relative 'pieces'

class ChessBoard
  attr_reader :board

  def initialize(board = nil)
    @board = board || {
      'a8'=> Rook.new('black'), 'b8'=> Knight.new('black'), 'c8'=> Bishop.new('black'), 'd8'=> King.new('black'), 'e8'=> Queen.new('black'), 'f8'=> Bishop.new('black'), 'g8'=> Knight.new('black'), 'h8'=> Rook.new('black'),
      'a7'=> Pawn.new('black'), 'b7'=> Pawn.new('black'), 'c7'=> Pawn.new('black'), 'd7'=> Pawn.new('black'), 'e7'=> Pawn.new('black'), 'f7'=> Pawn.new('black'), 'g7'=> Pawn.new('black'), 'h7'=> Pawn.new('black'),
      'a6'=> " ", 'b6'=> " ", 'c6'=> " ", 'd6'=> " ", 'e6'=> " ", 'f6'=> " ", 'g6'=> " ", 'h6'=> " ",
      'a5'=> " ", 'b5'=> " ", 'c5'=> " ", 'd5'=> " ", 'e5'=> " ", 'f5'=> " ", 'g5'=> " ", 'h5'=> " ",
      'a4'=> " ", 'b4'=> " ", 'c4'=> " ", 'd4'=> " ", 'e4'=> " ", 'f4'=> " ", 'g4'=> " ", 'h4'=> " ",
      'a3'=> " ", 'b3'=> " ", 'c3'=> " ", 'd3'=> " ", 'e3'=> " ", 'f3'=> " ", 'g3'=> " ", 'h3'=> " ",
      'a2'=> Pawn.new('white'), 'b2'=> Pawn.new('white'), 'c2'=> Pawn.new('white'), 'd2'=> Pawn.new('white'), 'e2'=> Pawn.new('white'), 'f2'=> Pawn.new('white'), 'g2'=> Pawn.new('white'), 'h2'=> Pawn.new('white'),
      'a1'=> Rook.new('white'), 'b1'=> Knight.new('white'), 'c1'=> Bishop.new('white'), 'd1'=> King.new('white'), 'e1'=> Queen.new('white'), 'f1'=> Bishop.new('white'), 'g1'=> Knight.new('white'), 'h1'=> Rook.new('white')
      }
    end

    def move_piece(source, destination, player_color)
      #checks before moving
      if valid_piece?(source, player_color)
        @board[source] = @board[destination]
        @board[source] = " "
      end
    end

    def valid_piece?(piece_location, player_color)
      return @board[piece_location].color == player_color if @board[piece_location] != " "
    end

    def to_s
      @board.values.each_slice(8).each_with_index { |row, index| puts row.unshift(8 - index).join(" ") }
      puts "  a b c d e f g h"
    end

end