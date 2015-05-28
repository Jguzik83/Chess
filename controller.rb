require_relative 'viewer.rb'

class Controller

  def initialize
    system 'clear'
    Viewer.welcome_message
    run
  end

  def run
    until game_finished?
      Viewer.whos_turn(player)
      Viewer.whats_move(player)
      move = Viewer.get_move
      #calculate moves method
      Viewer.display_moves
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
