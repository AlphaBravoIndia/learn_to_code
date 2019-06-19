require 'byebug'

class Array
  def my_each(&prc)
    self.length.times do |i|
      prc.call(self[i])
    end

    self
  end

  def my_select(&prc)
    selected = []
    self.my_each do |item|
      selected << item if prc.call(item)
    end

    selected
  end

  def my_reject(&prc)
    rejected = []
    self.my_each do |item|
      rejected << item unless prc.call(item)
    end

    rejected
  end

  def my_any?(&prc)
    self.my_each do |item|
      return true if prc.call(item)
    end

    false
  end

  def my_all?(&prc)
    self.my_each do |item|
      return false unless prc.call(item)
    end

    true
  end

  def my_flatten
    return [self] if !self.is_a?(Array)
    flatten = []
    self.my_each do |el|
      if el.is_a?(Array)
        flatten.concat(el.my_flatten)
      else
        flatten << el
      end
    end
    
    flatten
  end

  def my_zip(*arrays)
    zipped = []
    
    self.length.times do |i|
      subzip = [self[i]]

      arrays.my_each do |array|
        subzip << array[i]
      end

      zipped << subzip
    end

    zipped
  end

  def my_rotate(number=1)
    rotated = Array.new(self.length)

    self.my_each do |el|
      current_index = self.index(el)
      new_index = (current_index - number) % self.length
      rotated[new_index] = el
    end

    rotated
  end

  def my_join(seperator="")
    joined = ""

    self.length.times do |i|
      joined += self[i]
      joined += seperator unless i == length - 1
    end

    joined
  end

  def my_reverse
    reverse = []

    self.my_each do |el|
      reverse.unshift(el)
    end

    reverse
  end

  def bubble_sort!(&prc)
    prc ||= Proc.new { |a, b| a <=> b }
    sorted = false

    while !sorted
      sorted = true

      (0...self.length-1).each do |i|

        if prc.call(self[i], self[i+1]) == 1
          sorted = false
          self[i], self[i+1] = self[i+1], self[i]
        end

      end
    end

    self
  end

  def bubble_sort(&prc)
    self.dup.bubble_sort!
  end
end

def factors(num)
  factors = []
  
  (1...num).each do |factor|
    if num % factor == 0 
      factors << factor
    end
  end

  factors
end

def substrings(string)
  substrings = []

  string.each_char.with_index do |char1, idx1|
    substrings << char1

    string.each_char.with_index do |char2, idx2|

      if idx2 > idx1
        substrings << string[idx1..idx2]
      end

    end
  end

  substrings
end

def subwords(word, dictionary)
  substrings = substrings(word)
  p substrings

  subwords = substrings.select do |substring|
    dictionary.include?(substring)
  end

  subwords
end