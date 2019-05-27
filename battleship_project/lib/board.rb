class Board
  attr_reader :size

  def initialize(n)
    @grid = Array.new(n) { Array.new(n, :N) }
    @size = n * n
  end

  def [](position)
    row, column = position
    @grid[row][column]
  end

  def []=(position, value)
    row, column = position
    @grid[row][column] = value
  end

  def num_ships
    @grid.flatten.count { |el| el == :S }
  end

  def attack(position)
    if self[position] == :S
      self[position] = :H
      puts "you sunk my battleship!"
      return true
    else
      self[position] = :X
      return false
    end
  end

  def place_random_ships
    while self.num_ships != self.size/4
      position = [rand(Integer.sqrt(self.size)), rand(Integer.sqrt(self.size))]
      self[position] = :S
    end
  end

  def hidden_ships_grid
    @grid.map do |row|
      row.map do |el|
        if el == :S
          el = :N
        else
          el
        end
      end
    end
  end

  def self.print_grid(grid)
    grid.each do |row|
      line = ""
      row.each { |el| line += "#{el} "}
      puts line.strip
    end
  end

  def cheat
    Board.print_grid(@grid)
  end

  def print
    Board.print_grid(hidden_ships_grid)
  end
end
