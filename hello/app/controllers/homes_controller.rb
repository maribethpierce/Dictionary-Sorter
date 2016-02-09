class HomesController < ApplicationController

  def index
    # @words =
  end
  def new
    @dictionary = UniqueSequenceExtractor.new("sdf")
  end

  def create
    @extractor = UniqueSequenceExtractor.new(params["unique_sequence_extractor"]["dictionary"])
    render text: @extractor.unique_sequences
  end

end
