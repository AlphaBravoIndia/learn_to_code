def partition(arr, num)
  new_arr = Array.new(2) { Array.new }
  arr.each do |el|
    if el < num
      new_arr[0] << el
    else
      new_arr[1] << el
    end
  end
  new_arr
end

def merge(hash1, hash2)
  hash = {}
  hash1.each { |key, value| hash[key] = value }
  hash2.each { |key, value| hash[key] = value }
  hash
end

def censor(sentence, curse_words)
  vowels = "aeiou"
  censored = []
  sentence.split(" ").each do |word|
    if curse_words.include?(word.downcase) || curse_words.include?(word.upcase)
      censored_word = ""
      word.each_char do |char|
        if vowels.include?(char.downcase)
          censored_word += "*"
        else
          censored_word += char
        end
      end
      censored << censored_word
    else
      censored << word
    end
  end
  censored.join(" ")
end

def power_of_two?(num)
  if num == 1
    return true
  end
  i = 0
  while i < num
    if 2 ** i == num
      return true
    end
    i += 1
  end
  false
end