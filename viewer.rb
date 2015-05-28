require 'artii'

class Viewer
  def self.welcome_message
    a = Artii::Base.new :font => 'larry3d'
    puts a.asciify('WELCOME')
    puts "Welcome to our chess game"
  end

  def self.whos_turn(player)
    puts "#{player}'s turn"
  end

  def self.whats_move(player)
    puts "#{player}, your move?"
  end

  def get_move
    gets.chomp
  end

  def display_moves(array)
    #need to do something here because i don't want to change array,
    #but i don't want to print out an array
    print "#{array}"
  end


end
