require_relative 'piece'

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

    def get_piece(position)  # return's the class of the piece at give position
      @board[position].class
    end

    def move_piece(source, destination) # move the piece from source to destination
        @board[destination] = @board[source]
        @board[source] = " "
    end

    def valid_piece?(piece_location, player_color) # checks if the player have chosen a valid piece to move
      return @board[piece_location].color == player_color if @board[piece_location] != " "
    end

    def to_s # prints board out
      @board.values.each_slice(8).each_with_index { |row, index| puts row.unshift(8 - index).join("   ") }
      puts '    ' + ('a'..'h').to_a.join('   ')
    end

    def possible_moves(piece_location)
      coordinate = coordinate_position_convert(piece_location)
      @board[piece_location].moves.map { |moves| position_calculator(piece_location, moves) }
    end

    #private
    def coordinate_position_convert(input) # converts coordinate ('a1') to position ([1,1]) or vice versa
      mapping = { 1 => 'a', 2 => 'b', 3 => 'c', 4 => 'd', 5 => 'e', 6 => 'f', 7 => 'g', 8 => 'h' }

      if input.kind_of?(Array)
        input[0] = mapping[input[0]]
        input.join
      else
        input.chars.map { |coordinate| coordinate =~ /[a-z]/ ? mapping.invert[coordinate] : coordinate.to_i }
      end
    end

    def position_calculator(source, destination) # calc the x, y distances from given positions ([x, y])
      if source.kind_of?(String) != destination.kind_of?(String)  # for if one input is 'a2' and other [1,2]
        if source.kind_of?(String)
          source = coordinate_position_convert(source)
        elsif destination.kind_of?(String)
          destination = coordinate_position_convert(destination)
        end
      elsif source.kind_of?(String) && destination.kind_of?(String)
        source = coordinate_position_convert(source)
        destination = coordinate_position_convert(destination)
      end
      destination.zip(source).map { |coordinates| coordinates.first - coordinates.last }
    end

    def generic_retrieve(position, row_or_col) # returns array of the color of the pieces in the row or col
      row_or_col == "col" ? pos = 0 : pos = 1
      @board.select do |space, piece|
        space[pos] == position[pos]
      end.values.map { |piece| piece.color if piece.class != String }
    end




end
