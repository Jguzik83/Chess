
class King

	def initialize(color)
		@color = color
	end

	def valid_moves(max_dx,max_dy)
	end

	def to_s
		if @color == 'white'
			'♔'	
		else
			'♚'
		end
	end

end

class Queen

	def initialize(color)
		@color = color
	end

	def valid_moves(max_dx,max_dy)
	end

	def to_s
		if @color == 'white'
			'♕'	
		else
			'♛'	
		end
	end

end

class Rook

	def initialize(color)
		@color = color
	end

	def valid_moves(max_dx,max_dy)
	end

	def to_s
		if @color == 'white'
			'♖'
		else
			'♜'
		end
	end

end

class Bishop
	
	def initialize(color)
		@color = color
	end	

	def valid_moves(max_dx,max_dy)
	end

	def to_s
		if @color == 'white'
			'♗'
		else
			'♝'
		end
	end

end

class Knight

	def initialize(color)
		@color = color
	end

	def valid_moves(max_dx,max_dy)
	end

	def to_s
		if @color == 'white'
			'♘'
		else
			'♞'
		end
	end

end

class Pawn

	def initialize(color)
		@color = color
	end

	def valid_moves(max_dx,max_dy)
	end

	def to_s
		if @color == 'white'
			'♙'
		else
			'♟'
		end
	end

end

