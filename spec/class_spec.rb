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

# Trying to figure out how to test output to a file... not there yet.
  it "should output words and sequences to a file" do
    list = ["arrow"]
    test_list = UniqueSequenceExtractor.new(list)
    allow(File).to receive(:open).and_yield(open_file)
    expect(File.read('sequences.txt')).to eq("arro\nrrow")
  end
end
