def palindrome?(word)
  word.each_char.with_index { |char, i| return false if char != word[-i-1] }
  true
end