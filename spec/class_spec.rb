require 'spec_helper'
require_relative '../class'
require 'pry'

list = ["arrows", "carrots", "give", "me", "dominoes", "dominion", "dominic", "appalachian", "appalcart"]

RSpec.describe "all_sequences" do

  it "should return a hash of (K)sequences and (V)words when given a list file" do
    test_list = UniqueSequenceExtractor.new(list)
    words = test_list.all_sequences
    expect(words.class).to eq(Hash)
    expect(words.keys[0].length).to eq(4)
    expect(words.keys[-1].length).to eq(4)
  end

  it "should delete all pairs where sequence is duplicated" do
    test_list = UniqueSequenceExtractor.new(list)
    all_words = test_list.all_sequences
    words = test_list.unique_sequences
    expect(words.keys.length).to_not eq(all_words.length)
    expect(words.keys.uniq.length).to eq(words.keys.length)
    expect(words.keys).to_not include("arro")
    expect(words.keys).to include("rrot")
  end

  it "should create 'sequences.txt'/'words.txt' and store sequences/words in the files" do
    test_list = UniqueSequenceExtractor.new(list)
    test_list.output_unique_sequences
    test_list.output_matching_words
    expect(File.exists? "sequences.txt").to eq(true)
    expect(File.exists? "words.txt").to eq(true)
    expect(File.read 'sequences.txt').to_not include('arro')
    expect(File.read 'sequences.txt').to include('rrot')
    expect(File.read 'words.txt').to include('give')
    expect(File.read 'words.txt').to_not include('me')
  end
end
