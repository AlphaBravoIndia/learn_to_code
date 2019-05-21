# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def prime?(number)
  return false if number < 2
  (2..number/2).none? { |factor| number % factor == 0 }
end

def largest_prime_factor(number)
  number.downto(2) { |factor| return factor if number % factor == 0 && prime?(factor) }
end

def unique_chars?(string)
  count = Hash.new(0)
  string.each_char { |char| count[char] += 1 }
  count.each { |k, v| return false if count[k] > 1 }
  true
end

def dupe_indices(array)
  dupe_indices = Hash.new { |h,k| h[k] = [] }
  array.each_with_index { |ele, i| dupe_indices[ele] << i }
  dupe_indices.select { |k,v| v.length > 1 }
end

def ana_array(array1, array2)
  ele_count(array1) == ele_count(array2)
end

def ele_count(arr)
  count = Hash.new(0)
  arr.each { |ele| count[ele] += 1 }
  count
end