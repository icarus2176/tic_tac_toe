class Player
  attr_accesor @name, @symbol

  def initialize(name, symbol)
    @name, @symbol = name, symbol
  end
end

class Board

end

class Space
  attr_accesor @content
  attr_reader @position
  @content = ""

  def initialize(position)
    @position = position
  end
end

class Game
  def new_game
    board = Board.new
  end

  def play_game

  end

  def win?

  end
end