require 'pry'

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

  def self.get_move
    gets.chomp.downcase
  end

  def self.display_moves(string)
    print "#{string}\n"
  end

  def self.where_to(player, position)
    puts "#{player}, move #{position} where?\n"
  end

  def self.recap(player, piece, position, move_to)
    puts "Ok, #{player}'s #{piece} #{position} to #{move_to}"
  end

  def self.capture
    puts "Ok, #{player}'s #{piece} captures #{player == 'white' ? 'black' : 'white'}'s #{move_to}"
  end

  def self.invalid_piece
    puts "I'm sorry, but that isn't your piece!"
  end

  def self.invalid_move
    puts "I'm sorry, but that is not a possible move"
  end
end
