def reverser(string, &prc)
  new_string = ""
  string.each_char { |char| new_string = char + new_string }
  prc.call(new_string)
end

def word_changer(sentence, &prc)
  new_sentence = sentence.split(" ").map { |word| prc.call(word) }
  new_sentence.join(" ")
end

def greater_proc_value(number, prc1, prc2)
  prc1_value = prc1.call(number)
  prc2_value = prc2.call(number)
  return prc1_value if prc1_value > prc2_value
  prc2_value
end

def and_selector(array, prc1, prc2)
  new_array = []
  array.each { |ele| new_array << ele if prc1.call(ele) && prc2.call(ele) }
  new_array
end