require_relative 'dna'

class RNA
  attr_reader :bases, :dna_bases, :rna_bases

  def initialize(sequence)
    @bases = Gandalf.the_validator(sequence)
  end

  def dna_bases?
    @bases.include? "T"
  end

  def rna_bases?
    @bases.include? "U"
  end

  def dna_to_rna
    @rna_bases = @bases.gsub("T", "U")
  end

  def print_rna_bases
    dna_bases?  ? dna_to_rna : @rna_bases 
  end

end

