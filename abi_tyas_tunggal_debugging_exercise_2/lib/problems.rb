# Run `bundle exec rspec` and satisy the specs.
# You should implement your methods in this file.
# Feel free to use the debugger when you get stuck.

def largest_prime_factor(number)
  largest_factor = 1
  (1..number).each { |i| largest_factor = i if number % i == 0 && prime?(i) }
  largest_factor
end

def prime?(number)
  if number < 2
    return false
  end

  (2..number/2).each do |i|
    if number % i == 0
      return false
    end
  end

  true
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
  return false if array1.length != array2.length
  sorted_array1 = bubble_sort(array1)
  sorted_array2 = bubble_sort(array2)
  sorted_array1.each_with_index { |ele, i| return false if ele != sorted_array2[i] }
  true
end

def bubble_sort(arr)
  sorted = false
  while !sorted
      sorted = true

      (0..arr.length-2).each do |i|
          if arr[i] > arr[i+1]
              arr[i], arr[i+1] = arr[i+1], arr[i]
              sorted = false
          end
      end
  end
  
  arr
end