def select_even_nums(numbers)
  numbers.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject { |dog| dog["age"] < 3 }
end

def count_positive_subarrays(arrays)
  arrays.count { |subarray| subarray.sum > 0 }
end

def aba_translate(word)
  new_word = ""
  
  word.each_char do |char|
    if "aeiou".include?(char)
      new_word += char + "b" + char
    else
      new_word += char
    end
  end

  new_word
end

def aba_array(words)
  words.map { |word| aba_translate(word) }
end