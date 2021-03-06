def reverser(string, &prc)
  prc.call(string.reverse)
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

def alternating_mapper(array, prc1, prc2)
  new_array = []
  array.each_with_index do |ele, i|
    if i.even?
      new_array << prc1.call(ele)
    else
      new_array << prc2.call(ele)
    end
  end
  new_array
end