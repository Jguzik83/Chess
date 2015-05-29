
# white chess king	♔	U+2654	&#9812;
# white chess queen	♕	U+2655	&#9813;
# white chess rook	♖	U+2656	&#9814;
# white chess bishop	♗	U+2657	&#9815;
# white chess knight	♘	U+2658	&#9816;
# white chess pawn	♙	U+2659	&#9817;
# black chess king	♚	U+265A	&#9818;
# black chess queen	♛	U+265B	&#9819;
# black chess rook	♜	U+265C	&#9820;
# black chess bishop	♝	U+265D	&#9821;
# black chess knight	♞	U+265E	&#9822;
# black chess pawn	♟	U+265F	&#9823;

require_relative 'piece'

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


end
