require_relative "board"
require_relative "player"

class Battleship
  attr_reader :board, :player

  def initialize(n)
    @player = Player.new
    @board = Board.new(n)
    @remaining_misses = @board.size / 2
  end

  def start_game
    self.board.place_random_ships
    puts "#{@board.num_ships} ships placed on the board."
    self.board.print
  end

  def lose?
    if @remaining_misses <= 0
      puts "you lose"
      return true
    else
      return false
    end
  end

  def win?
    if self.board.num_ships == 0
      puts "you win"
      return true
    else
      return false
    end
  end

  def game_over?
    if self.win? || self.lose?
      return true
    else
      return false
    end
  end

  def turn
    if !@board.attack(@player.get_move)
      @remaining_misses -= 1
    end
    self.board.print
    puts "#{@remaining_misses} misses left."
  end
end
