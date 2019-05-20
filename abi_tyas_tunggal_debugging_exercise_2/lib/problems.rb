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