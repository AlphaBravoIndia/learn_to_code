def reverser(string, &prc)
  new_string = ""
  string.each_char { |char| new_string = char + new_string }
  prc.call(new_string)
end