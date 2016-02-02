require 'pry'
long_list = File.open "dictionary"

class UniqueSequenceExtractor
  attr_reader :words

  def initialize(dictionary_file_path)
    @dictionary_file_path = dictionary_file_path
    @words = read_words_from_file
  end

  def output_unique_sequences
    File.open('sequences.txt', 'w') do |f|
      f.puts self.unique_sequences.keys.each { |k| puts "#{k}\n"}
    end
  end

  def output_matching_words
    File.open('words.txt', 'w') do |f|
      f.puts self.unique_sequences.values.each { |v| puts "#{v}\n"}
    end
  end

  def unique_sequences
    all_sequences.select { |seq, words| words.length == 1 }
  end

  def all_sequences
    sequences = Hash.new { |k, v| k[v] = []}
    self.words.each do |word|
      if word.length >= 4
        final = word.length - 4
        base = 0
        while base <= final do
          seq = word[base..(base + 3)]
          sequences[seq] << word
          base += 1
        end
      end
    end
    return sequences
  end
  private

  def read_words_from_file
    @words = []
    @dictionary_file_path.each do |word|
      @words << word.strip
    end
    @words
  end
end

dict = UniqueSequenceExtractor.new(long_list)
dict.output_unique_sequences
dict.output_matching_words
