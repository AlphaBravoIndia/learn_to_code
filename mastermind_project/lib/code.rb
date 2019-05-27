class Code
  attr_reader :pegs

  POSSIBLE_PEGS = {
    "R" => :red,
    "G" => :green,
    "B" => :blue,
    "Y" => :yellow
  }

  def Code.valid_pegs?(pegs)
    pegs.all? { |peg| POSSIBLE_PEGS.has_key?(peg.upcase) }
  end

  def initialize(pegs)
    if Code.valid_pegs?(pegs)
      @pegs = pegs.map(&:upcase)
    else
      raise "Invalid pegs"
    end
  end

  def Code.random(length)
    pegs = []
    length.times { pegs << POSSIBLE_PEGS.keys.sample }
    p pegs
    Code.new(pegs)
  end

  def Code.from_string(pegs)
    Code.new(pegs.split(""))
  end

  def [](i)
    @pegs[i]
  end

  def length
    @pegs.length
  end
end
