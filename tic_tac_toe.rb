class Player
  attr_accessor @name, @symbol

  def initialize(name, symbol)
    @name, @symbol = name, symbol
  end
end

class Board
  attr_accessor @spaces
  @spaces = Array.new(9)

  def display
    puts " " + @spaces[0] + " | " + @spaces[1] + " | " + @spaces[2] \
         "___ ___ ___" \
         " " + @spaces[3] + " | " + @spaces[4] + " | " + @spaces[5] \
         "___ ___ ___" \
         " " + @spaces[6] + " | " + @spaces[7] + " | " + @spaces[8]
  end

  def change_space(symbol, position)
    @spaces[position] = symbol
  end
end

class Game
  def new_game
    board = Board.new
  end

  def play_game
    active_player = 0
    until Game.win?(player1) || Game.win?(player2)
      if active_player = 0
        turn(player1)
        active_player += 1
      else
        turn(player2)
        active_player -= 1
      end
    end
  end
  
  def turn(player)

  end

  def win?(player)

  end
end