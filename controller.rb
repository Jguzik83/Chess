require_relative 'viewer.rb'
require_relative 'board.rb'

class Controller
  attr_reader :board, :players

  def initialize(board)
    @board = board
    system 'clear'
    Viewer.welcome_message
    @players = ['white', 'black']
    menu

  end

  def menu
    option = Viewer.get_move
    case option
    when "1"
      system 'clear'
      run
    when "2"
      parser
    when "quit"
      puts "Thanks for stopping by"
    else
      puts "Please enter a valid option!"
      menu
    end

    
    
  end

  def run
    until game_finished?
      player = players.first
      
      board.to_s
      puts "\n\n"
      Viewer.whos_turn(player)
      Viewer.whats_move(player)
      position = Viewer.get_move

      if position == 'quit'
        quit_save
      end

      if valid_selection?(position) && board.valid_piece?(position, player)#true/false if correct color piece is selected
        #method to get possible move locations
        array = board.possible_moves(position)
        current_piece = board.get_piece(position)
        string = array_splitter(array)
        Viewer.display_moves(player, string, current_piece, position)
        Viewer.where_to(player, position)
        destination = Viewer.get_move
        if valid_selection?(destination) == false
          Viewer.invalid_move
          sleep(0.7)
          system 'clear'
          run
        end



        if valid_move?(destination, array)
          #if destination_has_enemy_piece?   #here is a capture
            board.move_piece(position, destination)
            # Viewer.capture(piece)
          # else  #here there is no captre
          #   move method
          #   Viewer.recap(player, piece, position, move_to) #need to pull out of hash the piece
          # end
        # else
        #   Viewer.invalid_move
        #   system 'clear'
        #   run
        
        else
          Viewer.invalid_piece
          sleep(0.7)
          system 'clear'
          run
        end 
      end
      players.reverse!
      system 'clear'
    end
  end

  def valid_selection?(position)
    return true if ('a'..'h').include?(position[0]) && ('1'..'8').include?(position[1..-1])
    false
  end

  def valid_move?(move_to, array)
    return true if array.include?(move_to)
    false
  end

  def array_splitter(array)
    array.join(' ')
  end

  def game_finished?
    if checker?
      true
    else
      false
    end
  end

  def quit_save
    Viewer.menu_prompt
    option = Viewer.get_move


  end
 
  def checker?
    #do something here to test all positions
    #probably be something like board.check?
    false
  end

end

test = Controller.new(ChessBoard.new)

