<img src="http://imgur.com/S4QgqWy" align="right" />

# Unique Sequence Extractor


### About
The Unique Sequence Extractor accepts a 'dictionary' file of words.
A new instance of the extractor can be created like this:

dictionary = UniqueSequenceExtractor.new(input)  
where 'input' is a text file with each word on its own line.

Calling dictionary.output_unique_sequences creates a 'sequences.txt' file containing all of the sequences of four letters that occur exactly one time in the dictionary.

Calling dictionary.output_matching_words creates a 'words.txt' file containing all of the words that match each sequence, in the same order as the sequence that is their pair.
