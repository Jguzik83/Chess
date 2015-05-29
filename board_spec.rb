require_relative 'board'


describe ChessBoard do
  let(:board) {ChessBoard.new}

  it "get_piece method returns type of piece given the location of the piece" do
    expect(board.get_piece('d1')).to eq(King)
  end

  it "move_piece method moves a piece given it's start and end positions" do
    board.move_piece('g1', 'f3')
    expect(board.board['f3']).not_to eq(" ")
  end

  it "valid_piece? method checks if a player has picked the location of a piece he/she can move" do
    expect(board.valid_piece?('a1', 'white')).to eq(true)
    expect(board.valid_piece?('a1', 'black')).to eq(false)
  end


end

