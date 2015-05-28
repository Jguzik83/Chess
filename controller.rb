require_relative 'viewer.rb'

class Controller

  def initialize
    system 'clear'
    Viewer.welcome_message
    run
  end

  def run
    until game_finished?
      Viewer.whos_turn(player) #white's turn
      Viewer.whats_move(player) #white, your move?
      position = Viewer.get_move #get the position, make downcase for ease

      #check if that piece can get moved by the current player
      #if invalid piece for that player or not a possible choice, make choose
      #again (call run here?)

      #calculate moves method

      Viewer.display_moves #moves for white pawn #{position}:
      Viewer.where_to(player, position)#white, move #{position} where?

      move_to = Viewer.get_move

      #if valid_move? method
        #if destination_has_enemy_piece?   #here is a capture
          #move_piece method (return me the piece as string)
          #Viewer.capture(piece)
        #else  #here there is no captre
          #move method
          #Viewer.recap(player, piece, position, move_to) #need to pull out of hash the piece
        #end
      #else
        #Viewer.invalid_move
      #end


      #
    end
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
    false
  end

end


test = Controller.new
