require 'pry'
# Given a list of words, this class will return a
# Set of sequences unique amongst all the words
# long_list = File.open "dictionary"
long_list = ["arrows", "carrots", "give", "me", "dominoes", "dominion", "dominic", "appalachian", "appalcart"]

class UniqueSequenceExtractor
  attr_reader :words

  def initialize(dictionary_file_path)
    @dictionary_file_path = dictionary_file_path
    @words = read_words_from_file
  end

  # This method is responsible for writing
  # the unique sequences to a file.
  #
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

  # This method is responsible for taking filtering
  # out sequences that appear in more than one word.
  #
  def unique_sequences
    # we should only grab the uniq sequences
    all_sequences.select { |seq, words| words.length == 1 }
  end

  # This method is responsible for extracting sequences
  # from the words array.  Here is an example of what
  # the sequences dataset might look like.
  #
  # Example dataset: { 'arro' => ['arrow', 'carrot'] }
  #
  def all_sequences
    sequences = Hash.new { |k, v| k[v] = []}
    # do some stuff
    self.words.each do |word|
      if word.length >= 4
        final = word.length - 4
        base = 0
        until base == final
          seq = word[base..(base + 3)]
          sequences[seq] << word
          base += 1
        end
      end
    end
    return sequences
  end
  private

  # This method is responsible for reading
  # the file and returning an array of words.
  #
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
# dict.output_matching_words
