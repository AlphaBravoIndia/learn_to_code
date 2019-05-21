def select_even_nums(array)
  array.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array)
  array.count { |subarray| subarray.sum > 0 }
end

def aba_translate(string)
  new_string = ""
  string.each_char do |char|
    if "aeiou".include?(char)
      new_string += char + "b" + char
    else
      new_string += char
    end
  end
  new_string
end