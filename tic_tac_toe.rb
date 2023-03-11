class Player
  attr_accessor :symbol, :owned_spaces
  @owned_spaces = Array.new()
  
  def initialize(symbol)
    @symbol = symbol
  end

  def win?()
    win_positions = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    
    win_positions.each do |positions| 
      if @owned_spaces.array_includes?
        puts "Congratulations! " + self + " wins!"
        return true
        break
      end
      return false
    end
  end

  def turn()
    space
    while board.spaces[space]
      space = gets "Choose an empty space."
      space = space.chomp.to_i - 1
    end
    
    board.spaces[space] = @symbol
    @owned_spaces += space
  end
end

class Board
  attr_accessor :spaces
  @spaces = Array.new(9)

  def display
    puts "1) " + @spaces[0] + " |2) " + @spaces[1] + " |3) " + @spaces[2] + \
         "_____ _____ _____" + \
         "4) " + @spaces[3] + " |5) " + @spaces[4] + " |6) " + @spaces[5] + \
         "_____ _____ _____" + \
         "7) " + @spaces[6] + " |8) " + @spaces[7] + " |9) " + @spaces[8]
  end

  def change_space(symbol, position)
    @spaces[position] = symbol
  end
end

class Game
  def new_game
    @board = Board.new
    @player1 = Player.new("X")
    @player2 = Player.new("O")
  end

  def play_game
    active_player = 0
    until @player1.win?() || @player2.win?()
      if active_player == 0
        turn(@player1)
        active_player += 1
      else
        turn(@player2)
        active_player -= 1
      end
    end
  end
end

def array_includes?(array1, array2)
  array2 {|element| array1.include?(element)}
end 

game = Game.new

game.play_game