class Player
  attr_accessor @symbol

  def initialize(symbol)
    @symbol = symbol
  end
end

class Board
  attr_accessor @spaces
  @spaces = Array.new(9)

  def display
    puts "1) " + @spaces[0] + " |2) " + @spaces[1] + " |3) " + @spaces[2] \
         "_____ _____ _____" \
         "4) " + @spaces[3] + " |5) " + @spaces[4] + " |6) " + @spaces[5] \
         "_____ _____ _____" \
         "7) " + @spaces[6] + " |8) " + @spaces[7] + " |9) " + @spaces[8]
  end

  def change_space(symbol, position)
    @spaces[position] = symbol
  end
end

class Game
  def new_game
    board = Board.new
    player1 = Player.new("X")
    player2 = Player.new("O")
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
    space
    while board.@spaces[space]
      space = gets "Choose an empty space."
      space = space.chomp.to_i - 1
    end
    
    board.@spaces[space] = player.symbol
  end

  def win?(player)

  end
end