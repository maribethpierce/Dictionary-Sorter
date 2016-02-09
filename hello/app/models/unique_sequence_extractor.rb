require 'pry'

class UniqueSequenceExtractor
  include ActiveModel::Model
  attr_reader :words

  def initialize(text)
    @text = text
    @words = read_words
  end
  def dictionary
    return ""
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

  def read_words
    @words = []
    @text.split.each do |word|
      @words << word.strip
    end
    @words
  end
end
