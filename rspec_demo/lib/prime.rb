def prime?(num)
  if num < 2 
    return false
  end
  (2...num).each { |i| return false if num % i == 0 }
  true
end
