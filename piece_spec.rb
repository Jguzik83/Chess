require_relative 'piece.rb'

describe 'Piece' do

  it 'should initialize a a King' do
    piece = King.new('white')
    expect(piece).to be_a King
  end

  it 'should have a color attribute' do
    piece = King.new('white')
    expect(piece.color).to eq('white')
  end

  it 'should initialize a a Queen' do
    piece = Queen.new('black')
    expect(piece).to be_a Queen
  end

    it 'should have a color attribute' do
    piece = Queen.new('black')
    expect(piece.color).to eq('black')
  end

  it 'should initialize a a Rook' do
    piece = Rook.new('white')
    expect(piece).to be_a Rook
  end

  it 'should have a color attribute' do
    piece = Rook.new('black')
    expect(piece.color).to eq('black')
  end

  it 'should initialize a a Bishop' do
    piece = Bishop.new('white')
    expect(piece).to be_a Bishop
  end

  it 'should have a color attribute' do
    piece = Bishop.new('black')
    expect(piece.color).to eq('black')
  end

  it 'should initialize a a Knight' do
    piece = Knight.new('white')
    expect(piece).to be_a Knight
  end

   it 'should have a color attribute' do
    piece = Knight.new('white')
    expect(piece.color).to eq('white')
  end

  it 'Knight should be passable' do
    piece = Knight.new('black')
    expect(piece.passable).to eq(true)
  end

  it 'should initialize a a Pawn' do
    piece = Pawn.new('white')
    expect(piece).to be_a Pawn
  end

  it 'should have a color attribute' do
    piece = Pawn.new('black')
    expect(piece.color).to eq('black')
  end

  it 'should not be passable' do
    piece = Pawn.new('black')
    expect(piece.passable).to eq(false)
  end

  it 'should only allow a [0,1] move for Pawn' do
      piece = Pawn.new('black')
      expect(piece.valid_moves?([0,1])).to eq(true)
  end

  it 'should only allow a [0,1] move for Pawn' do
      piece = Pawn.new('black')
      expect(piece.valid_moves?([1,1])).to eq(false)
  end

  it 'should only allow X OR Y  move for Rook' do
      piece = Rook.new('black')
      expect(piece.valid_moves?([6,0])).to eq(true)
  end

  it 'should only allow X OR Y  move for Rook' do
      piece = Rook.new('black')
      expect(piece.valid_moves?([1,1])).to eq(false)
  end

  it 'should allow any diagonal move for a Bishop' do
      piece = Bishop.new('black')
      expect(piece.valid_moves?([2,2])).to eq(true)
  end

  it 'should allow any diagonal move for a Bishop' do
      piece = Bishop.new('black')
      expect(piece.valid_moves?([1,2])).to eq(false)
  end

  it 'should allow a single box move in any direction for a King' do
      piece = King.new('black')
      expect(piece.valid_moves?([1,1])).to eq(true)
  end

  it 'should allow a single box move in any direction for a King' do
      piece = King.new('black')
      expect(piece.valid_moves?([2,1])).to eq(false)
  end

  it 'should allow a single box move in any direction for a King' do
      piece = King.new('black')
      expect(piece.valid_moves?([1,0])).to eq(true)
  end

  it 'should allow an L-shaped move in any direction for a Knight' do
      piece = Knight.new('black')
      expect(piece.valid_moves?([1,2])).to eq(true)
  end

  it 'should allow an L-shaped move in any direction for a Knight' do
      piece = Knight.new('black')
      expect(piece.valid_moves?([2,1])).to eq(true)
  end

  it 'should allow an L-shaped move in any direction for a Knight' do
      piece = Knight.new('black')
      expect(piece.valid_moves?([2,2])).to eq(false)
  end

  it 'should allow for any number of moves in any direction for a Queen' do
      piece = Queen.new('black')
      expect(piece.valid_moves?([3,3])).to eq(true)
  end

  it 'should allow for any number of moves in any direction for a Queen' do
      piece = Queen.new('black')
      expect(piece.valid_moves?([3,3])).to eq(true)
  end

  it 'should allow for any number of moves in any direction for a Queen' do
      piece = Queen.new('black')
      expect(piece.valid_moves?([4,0])).to eq(true)
  end

    it 'should allow for any number of moves in any direction for a Queen' do
      piece = Queen.new('black')
      expect(piece.valid_moves?([2,1])).to eq(false)
  end

      it 'should return false if Queen does not move' do
      piece = Queen.new('black')
      expect(piece.valid_moves?([0,0])).to eq(false)
  end


    it 'should return false if Pawn does not move' do
      piece = Pawn.new('black')
      expect(piece.valid_moves?([0,0])).to eq(false)
  end

    it 'should return false if Rook does not move' do
        piece = Rook.new('black')
        expect(piece.valid_moves?([0,0])).to eq(false)
  end

      it 'should return false if King does not move' do
        piece = King.new('black')
        expect(piece.valid_moves?([0,0])).to eq(false)
  end

      it 'should return false if Bishop does not move' do
        piece = Bishop.new('black')
        expect(piece.valid_moves?([0,0])).to eq(false)
  end

      it 'should return false if Knight does not move' do
        piece = Knight.new('black')
        expect(piece.valid_moves?([0,0])).to eq(false)
  end

end
