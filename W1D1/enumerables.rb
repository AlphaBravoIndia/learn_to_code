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

  def my_zip(*args)
    array = Array.new(self.length) { Array.new(args.length + 1) }
    inputs = [self] + args
    inputs.length.times do |i|
      current = inputs[i]
      current.length.times do |j|
        array[j][i] = current[j]
      end
    end
    p inputs

    array
  end
end