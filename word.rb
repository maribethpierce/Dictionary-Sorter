require "pry"
# long_list = File.open "dictionary"
long_list = ["arrows", "carrots", "give", "me", "dominoes", "dominion", "dominic", "appalachian", "appalcart"]
dictionary = []
long_list.each { |word| dictionary << word }

hash = Hash.new

dictionary.each do |word|
  if word.length >= 4
    hash[word] = []
    final = word.length - 4
    base = 0
    until base == final
      segment = word[base..(base + 3)]
      hash[word] << segment
      base += 1
    end
  end
end
segments = []
hash.each do |k, v|
  segments << v
end

unique_segments = segments.flatten!.uniq
unique_segments.each do |element|
  if segments.count(element) > 1
    segments.delete(element)
  end
end

unique_hash = Hash.new
segments.each do |seg|
  hash.each do |k, v|
    if v.include?(seg)
      unique_hash[seg] = k
    end
  end
end

puts 'sequences       words'
puts ''
unique_hash.each do |k,v|
  puts "#{k}            #{v}"
end
