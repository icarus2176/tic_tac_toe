class Player
  attr_accessor :symbol, :owned_spaces
  
  
  def initialize(name, symbol)
    @name, @symbol = name, symbol
    @owned_spaces = Array.new()
  end

  def win
    win_positions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    win_positions.each do |positions| 
      if array_includes?(@owned_spaces, positions)
        puts "Congratulations! " + @name + " wins!"
        return true
      end
    end
    return false
  end

  
end

class Game
  def new_game
    @player1 = Player.new("Player 1","X")
    @player2 = Player.new("Player 2", "O")
    @spaces = Array.new(9, " ")

    display
  end

  def play_game
    new_game
    active_player = 0
    until full?
      if active_player == 0
        turn(@player1)
        if @player1.win == true
          break
        end
        active_player += 1
      elsif active_player == 1
        turn(@player2)
        if @player2.win == true
        break
        end
        active_player -= 1
      end
    end
    puts "Play  again? (y/n)"
    if gets.chomp == "y"
      play_game
    end
  end

  def turn(player)
    space = 20
    symbol = player.symbol
    until @spaces[space] == " "
      puts  "Choose an empty space (Type number of the space then press enter)."
      space = gets.chomp.to_i - 1
    end
    
    change_space(symbol, space)
    player.owned_spaces .push(space)
    display
  end

  def display
    puts "1) " + @spaces[0] + " |2) " + @spaces[1] + " |3) " + @spaces[2] +
         "\n_____ _____ _____" +
         "\n4) " + @spaces[3] + " |5) " + @spaces[4] + " |6) " + @spaces[5] +
         "\n_____ _____ _____" +
         "\n7) " + @spaces[6] + " |8) " + @spaces[7] + " |9) " + @spaces[8]
  end

  def change_space(symbol, position)
    @spaces[position] = symbol
  end

  def full?
    if @spaces.none? { |space| space == " "} == true
      true
    end
    false
  end
end

def array_includes?(array1, array2)
  includes = true
  if array1 == nil
    return false
  end

  array2.each do |element| 
    if array1.include?(element) == false
      includes = false
    end
  end
  includes
end 

game = Game.new

game.play_game