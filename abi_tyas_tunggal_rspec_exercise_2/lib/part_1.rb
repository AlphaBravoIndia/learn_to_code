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