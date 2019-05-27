class Code
  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  attr_reader :pegs

  def self.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end

  def self.random(length)
    pegs = []
    length.times { pegs << POSSIBLE_PEGS.keys.sample }
    p pegs
    Code.new(pegs)
  end

  def self.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Invalid pegs"
    end
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end

  def num_exact_matches(guess)
    exact_matches = 0
    guess.pegs.each_with_index { |peg, i| exact_matches += 1 if peg == self[i]}
    exact_matches
  end

  def num_near_matches(guess)
    near_matches = 0
    guess.pegs.each_with_index { |peg, i| near_matches += 1 if peg != self[i] && @pegs.include?(peg) }
    near_matches
  end

  def ==(code)
    self.pegs == code.pegs
  end
end
