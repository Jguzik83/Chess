class Piece
	#will be the parent class of King, Queen, Rook, Bishop, Knight, Pawn
	attr_reader :color, :passable
	def initialize(color)
		@color = color
		@passable = false
	end
end


class King < Piece
# The king moves exactly one vacant square in any direction:
# forwards, backwards, left, right, or diagonally. It can also castle in conjunction with a rook.
	attr_reader :max_move
	def initialize(color)
		super(color)
		@max_move = 1
	end

	def valid_moves?(move)
		#Test method to move pieces
		move >= @max_move
	end

	def to_s
		if @color == 'white'
			'♔'
		else
			'♚'
		end
	end
end

class Queen < Piece
# The queen moves any number of vacant squares in any direction:
# forwards, backwards, left, right, or diagonally, in a straight line.
	attr_reader :max_move
	def initialize(color)
		super(color)
		@max_move = 8
	end

	def valid_moves?(move)
		move >= @max_move
	end

	def to_s
		if @color == 'white'
			'♕'
		else
			'♛'
		end
	end

end

class Rook < Piece
	# The rook moves any number of vacant squares forwards, backwards, left, or right in a straight line.
	# It also takes part, along with the king, in a special move called castling.
	attr_reader :max_move
	def initialize(color)
		super(color)
		@max_move = 8
	end

	def valid_moves?(move)
		move >= @max_move
	end

	def to_s
		if @color == 'white'
			'♖'
		else
			'♜'
		end
	end

end

class Bishop < Piece
	# The bishop moves any number of vacant squares diagonally in a straight line. Consequently, a bishop stays on squares of the same color throughout a game.
	# The two bishops each player starts with move on squares of opposite colors.
	attr_reader :max_move
	def initialize(color)
		super(color)
		@max_move = 8
	end

	def valid_moves?(move)
		move >= @max_move
	end

	def to_s
		if @color == 'white'
			'♗'
		else
			'♝'
		end
	end

end

class Knight < Piece
	# The knight moves on an extended diagonal from one corner of any 2×3 rectangle of squares to the furthest opposite corner.
	# Consequently, the knight alternates its square color each time it moves.
	# The knight is the only piece that jumps over any intervening piece(s) when moving
	# (castling being the only special instance in which pieces jump over one another).
	attr_reader :max_move
	def initialize(color)
		super(color)
		@max_move = 8
		@passable = true
	end

	def valid_moves?(move)
		move >= @max_move
	end

	def to_s
		if @color == 'white'
			'♘'
		else
			'♞'
		end
	end

end

class Pawn < Piece
	# The pawn moves forward exactly one space, or optionally, two spaces when on its starting square,
	# toward the opponent's side of the board. When there is an enemy piece one square diagonally ahead
	# of the pawn, either left or right, then the pawn may capture that piece. A pawn can perform a special
	# type of capture of an enemy pawn called en passant. If the pawn reaches a square on the back rank of the opponent, it promotes to the player's choice of a queen, rook, bishop, or knight
	attr_reader :max_move
	def initialize(color)
		super(color)
		@max_move = 1
	end

	def valid_moves?(move)
		move >= @max_move
	end

	def to_s
		if @color == 'white'
			'♙'
		else
			'♟'
		end
	end

end

# p piece = King.new("white")
# p pawn = Pawn.new("black")


