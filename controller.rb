require_relative 'viewer.rb'
require_relative 'board.rb'

class Controller
  attr_reader :board, :players

  def initialize(board)
    @board = board
    system 'clear'
    Viewer.welcome_message
    @players = ['white', 'black']
    
    run
    
  end

  def run
    until game_finished?
      player = players.first
      system 'clear'
      puts board
      Viewer.whos_turn(player) #white's turn
      Viewer.whats_move(player) #white, your move?
      position = Viewer.get_move #get the position, make downcase for ease
      if board.valid_piece?(position, player) #true/false if correct color piece is selected
          
        #method to get possible move locations
          
        string = array_spliter#(array)
        Viewer.display_moves(string)
        Viewer.where_to(player, position)
        move_to = Viewer.get_move

         #if valid_move?(move_to, array) method
            
           #if destination_has_enemy_piece?   #here is a capture
             #move_piece method (return me the piece as string)
             #Viewer.capture(piece)
           #else  #here there is no captre
             #move method
             #Viewer.recap(player, piece, position, move_to) #need to pull out of hash the piece
           #end
         #else
           #Viewer.invalid_move
           #run(player) Think about this as well, because I need to return with correct player, not 
           #go to the next player
         #end
       else
         Viewer.invalid_piece
          sleep(0.5)
          run #think about this, because we need to return with
              #correct player whos turn it is
       end

     players.reverse!
     end
    
  end

  def valid_selection?(position)
    test = position.split
    return true if ('a'..'h').include?(test[0]) && ('1'..'8').include?(test[1])
    false
  end


  def valid_move?(move_to, array)
    return true if array.include?(move_to)
    false
  end

  def array_spliter#(array)
    #array.join(' ')
    ['a1','b2'].join(' ')
  end

  def game_finished?
    if checker?
      true
    else
      false
    end
  end

  def checker?
    #do something here to test all positions
    #probably be something like board.check?
    false
  end

end

test = Controller.new(ChessBoard.new)

