def palindrome?(word)
  word.each_char.with_index { |char, i| return false if char != word[-i-1] }
  true
end

def substrings(word)
  arr = []
  (0...word.length).each do |start_idx|
    (start_idx...word.length).each do |end_idx|
      arr << word[start_idx..end_idx]
    end
  end
  arr
end

def palindrome_substrings(word)
  substrings(word).select { |substring| palindrome?(substring) && substring.length > 1}
end