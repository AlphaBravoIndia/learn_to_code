def reverser(string, &prc)
  new_string = ""
  string.each_char { |char| new_string = char + new_string }
  prc.call(new_string)
end

def word_changer(sentence, &prc)
  new_sentence = sentence.split(" ").map { |word| prc.call(word) }
  new_sentence.join(" ")
end