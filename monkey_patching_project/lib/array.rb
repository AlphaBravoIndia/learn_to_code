# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.empty?
    self.max - self.min
  end

  def average
    return nil if self.empty?
    self.sum / self.length.to_f
  end

  def median
    return nil if self.empty?
    sorted = self.sort
    mid_index = self.length / 2
    if self.length.odd?
      return sorted[mid_index]
    else
      return (sorted[mid_index-1] + sorted[mid_index]) / 2.0
    end
  end

  def counts
    count = Hash.new(0)
    self.each { |el| count[el] += 1 }
    count
  end

  def my_count(value)
    count = 0
    self.each { |el| count += 1 if el == value }
    count
  end

  def my_index(value)
    self.each_with_index { |el, i| return i if el == value }
    nil
  end

  def my_uniq
    elements = {}
    self.each { |el| elements[el] = true }
    elements.keys
  end

  def my_transpose
    transposed = []
    self.each_with_index do |subarray, idx1|
      row = []
      subarray.each_with_index do |el, idx2|
        row << self[idx2][idx1]
      end
      transposed << row
    end
    transposed
  end
end
