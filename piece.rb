KING_MOVES = [[0,1],[1,1],[1,0],[1,-1],[0,-1],[-1,-1],[-1,0],[-1,1]]
PAWN_MOVES = [[0,1],[0,2]]
BISHOP_MOVES = [
	[[1,1],[2,2],[3,3],[4,4],[5,5],[6,6],[7,7],[8,8]],
  [[-1,-1],[-2,-2],[-3,-3],[-4,-4],[-5,-5],[-6,-6],[-7,-7],[-8,-8]],
    ]
KNIGHT_MOVES = [[-1,2],[1,2],[-2,1],[2,1],[-2,-1],[2,-1],[-1,-2],[1,-2]]
ROOK_MOVES = [
	[[0,1],[0,2],[0,3],[0,4],[0,5],[0,6],[0,7],[0,8]],
	[[0,-1],[0,-2],[0,-3],[0,-4],[0,-5],[0,-6],[0,-7],[0,-8]],
	[[1,0],[2,0],[3,0],[4,0],[5,0],[6,0],[7,0],[8,0]],
	[[-1,0],[-2,0],[-3,0],[-4,0],[-5,0],[-6,0],[-7,0],[-8,0]]
		]

class Piece
	attr_reader :color, :passable, :moved
	def initialize(color)
		@color = color
		@passable = false
		@moved = false
	end
end


class King < Piece
# The king moves exactly one vacant square in any direction:
# forwards, backwards, left, right, or diagonally. It can also castle in conjunction with a rook.
attr_reader :possible_moves
	def initialize(color)
		super(color)
		@possible_moves = KING_MOVES
	end

	def valid_moves?(move_arr) #array[dx,dy]
		return false if move_arr == [0,0]
		move_arr[0].between?(0,1) && move_arr[1].between?(0,1)
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
attr_reader :possible_moves
	def initialize(color)
		super(color)
		@possible_moves = BISHOP_MOVES + ROOK_MOVES
	end

	def valid_moves?(move_arr)
		return false if move_arr == [0,0]
		#Bishop moves and #Rook moves
		move_arr[0] == move_arr[1] || (move_arr[0].between?(1,8) && move_arr[1] == 0) || (move_arr[0] == 0 && move_arr[1].between?(1,8))
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
	attr_reader :possible_moves
	def initialize(color)
		super(color)
		@possible_moves = ROOK_MOVES
	end

	def valid_moves?(move_arr)
				move_arr[0] > 0 && move_arr[1] > 0
		(move_arr[0].between?(1,8) && move_arr[1] == 0) || (move_arr[0] == 0 && move_arr[1].between?(1,8))
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
	attr_reader :possible_moves
	def initialize(color)
		super(color)
		@possible_moves = BISHOP_MOVES

	end

	def valid_moves?(move_arr)
		move_arr[0] > 0 && move_arr[1] > 0 && move_arr[0] == move_arr[1]
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
	attr_reader :possible_moves
	def initialize(color)
		super(color)
		@passable = true
		@possible_moves = KNIGHT_MOVES
	end

	def valid_moves?(move_arr)
		move_arr[0] > 0 && move_arr[1] > 0
		(move_arr[0] == 1 && move_arr[1] == 2) ||
		(move_arr[0] == 2 && move_arr[1] == 1)
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
	attr_reader :possible_moves
	def initialize(color)
		super(color)
		@possible_moves = PAWN_MOVES
	end

	def valid_moves?(move_arr)
		move_arr[0] == 0 && move_arr[1] == 1
	end

	def to_s
		if @color == 'white'
			'♙'
		else
			'♟'
		end
	end
end
