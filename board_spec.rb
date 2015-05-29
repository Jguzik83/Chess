require_relative 'board'

describe 'ChessBoard' do

  it 'should instantiate a new ChessBoard' do
    board  = ChessBoard.new
    expect(board).to be_a ChessBoard
  end

  it 'should print out a board with initial piece settings' do
    board  = ChessBoard.new
    expect(board.to_s)
  end
#tests below for specific methods -- change arguments
  it 'should get a piece from the board' do
    board  = ChessBoard.new
    expect(board.get_piece(source)).
  end

  it 'should move a piece' do
    board  = ChessBoard.new
    expect(board.move_piece(source, destination))
  end

  it 'should tell us if a piece is valid' do
    board  = ChessBoard.new
    expect(board.valid_piece?(piece_location, player_color))
  end

  it 'should retrieve a column' do
    board  = ChessBoard.new
    expect(board.retrieve_column(col_num))
  end

  it 'retrieve a row' do
    board  = ChessBoard.new
    expect(retrieve_row(row_num))
  end

end