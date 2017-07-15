

def count_vowels(string)
  string= "kiruba"
   string.downcase
   get = string.scan(/[aeouiAEIOU]/).count
   puts get
end