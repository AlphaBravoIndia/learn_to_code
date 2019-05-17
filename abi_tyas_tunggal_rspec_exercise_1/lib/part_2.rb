def vowel?(char)
  vowels = "aeiou"
  vowels.include?(char.downcase)
end

def hipsterfy(word)
  i = word.length - 1
  while i > 0
    if vowel?(word[i])
      return word[0...i] + word[i+1..-1]
    end
    i -= 1
  end
  word
end

def vowel_counts(str)
  count = Hash.new(0)
  str.each_char { |char| count[char.downcase] += 1 if vowel?(char) }
  count
end

def caesar_cipher(message, n)
  alphabet = "abcdefghijklmnopqrstuvwxyz"
  arr = message.split("").map do |char|
    if alphabet.include?(char.downcase)
      new_char = alphabet.index(char) + n
      alphabet[new_char % 26]
    else
      char
    end
  end
  arr.join("")
end