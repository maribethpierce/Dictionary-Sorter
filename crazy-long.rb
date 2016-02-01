require 'pry'
require 'benchmark'
# enormous_list = File.open 'dictionary'
# word_list = []
# enormous_list.each do |word|
#   word_list << word
# end
word_list = ["arrows", "carrots", "give", "me", "dominoes", "dominion", "dominic", "appalachian", "appalcart"]
class Dictionary
  attr_accessor :sequences, :words, :sequences_uniq, :words_uniq, :list

  def initialize(list)
    @list = list
    @word_array = word_array
    @sequences = []
    @sequences_uniq = []
    @words = []
    @words_uniq = []
  end

  def word_array
    @word_array = []
    @list.each do |word|
      @word_array << word.strip
    end
  end

  def collect_segments
    self.word_array.each do |word|
      if word.length >= 4
        fourth_char = word.length - 3
        base = 0
        until base == fourth_char
          @sequences << word[base..(base + 3)]
          @words << word
          base += 1
        end
      end
    end
  end

  def unique_sets
    seg_hash = Hash.new
    word_hash = Hash.new
    indexes = []
    self.sequences.each_with_index do |item, index|
      seg_hash[index] = item
    end
    self.words.each_with_index do |item, index|
      word_hash[index] = item
    end
    seg_hash.each do |index, seg|
      if seg_hash.values.count(seg) == 1
        indexes << index
      end
    end
    @sequences_uniq = seg_hash.keep_if { |k, v| indexes.include?(k) }
    @words_uniq = word_hash.keep_if { |k, v| indexes.include?(k) }

  end

end

my_dictionary = Dictionary.new(word_list)
my_dictionary.collect_segments
my_dictionary.unique_sets
puts my_dictionary.sequences_uniq

puts my_dictionary.words_uniq
