def select_even_nums(array)
  array.select(&:even?)
end

def reject_puppies(dogs)
  dogs.reject { |dog| dog["age"] <= 2 }
end