def select_even_nums(array)
  array.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject { |dog| dog["age"] <= 2 }
end

def count_positive_subarrays(array)
  array.count { |subarray| subarray.sum > 0 }
end