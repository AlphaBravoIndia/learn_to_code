# Monkey-Patch Ruby's existing Array class to add your own custom methods
class Array
  def span
    return nil if self.length == 0
    self.max - self.min
  end

  def average
    return nil if self.length == 0
    self.sum / self.length.to_f
  end

  def median
    return nil if self.length == 0
    sorted = self.sort
    length = sorted.length
    if length.odd?
      return sorted[length/2]
    else
      return (sorted[length/2-1] + sorted[length/2]) / 2.0
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
    return nil
  end

  def my_uniq
    uniques = []
    self.each { |el| uniques << el if !uniques.include?(el) }
    uniques
  end

  def my_transpose
    transposed = Array.new(self.length) { Array.new(self.length) }
    self.each_with_index do |subarray, idx1|
      subarray.each_with_index do |el, idx2|
        transposed[idx2][idx1] = el
      end
    end
    transposed
  end
end
