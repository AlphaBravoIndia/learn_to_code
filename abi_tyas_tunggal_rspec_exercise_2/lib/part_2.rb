def palindrome?(word)
  word.each_char.with_index { |char, i| return false if char != word[-i-1] }
  true
end

def substrings(word)
  length = word.length
  arr = []
  i = 0
  while i < length
    j = i
    while j < length
      arr << word[i..j]
      j += 1
    end
    i += 1
  end
  arr
end

def palindrome_substrings(word)
  substrings(word).select { |substring| palindrome?(substring) && substring.length > 1}
end