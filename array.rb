require 'pry'
require 'benchmark'
# word_list = File.open 'dictionary'
word_list = ["arrows", "carrots", "give", "me", "dominoes", "dominion", "dominic", "appalachian", "appalcart"]
sequences = []
list = []
sequences = []
words = []

word_list.each do |item|
  list << item
end

list.each do |word|
  if word.length >= 4
    fourth_char = word.length - 3
    base = 0
    until base == fourth_char
      sequences << word[base..(base + 3)]
      base += 1
    end
  end
end

sequences.each do |s|
  if sequences.count(s) != 1
    sequences.delete(s)
  else
    words << list.select { |w|  /s/ }
  end
end
binding.pry



# pairs = Hash[sequences.zip words]
# pairs.each do |k, v|
#   pairs.keep_if { pairs.keys.count(k) == 1 }
# end

# pairs.each do |k, v|
#   if pairs.keys.count(k) == 1
#     sequences << k
#     words << v
#   end
# end
# sequences.each do |segment|
#   words << pairs[segment]
# end
#






#
