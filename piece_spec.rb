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
