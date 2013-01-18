require_relative 'gandalf'

class DNA
  attr_reader :nucleotides, :dna_bases, :result

  def initialize(sequence)
    @nucleotides = %w( A C G T U )
    # chomp it to remove newlines and such,
    # so we can have files as input too
    @dna_bases = sequence.chomp
    @result = []
  end

  def print_sequence
    @dna_bases
  end

  def print_bases
    print_sequence
  end

  def count_bases
    @dna_bases = Gandalf.the_validator(@dna_bases)

    @nucleotides.each do |base|
      result.push( @dna_bases.count(base) )
    end

    @result
  end

  def pretty_base_count
    count_bases
    @result.join(" ")
  end

end
