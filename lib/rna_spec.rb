require 'rspec'
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

describe RNA do


  it "takes a string of DNA nucleotides" do
    my_sequence = RNA.new("GATGGAACTTGACTACGTAAATT")
    my_sequence.bases.is_a?(String).should == true
  end

  it "takes a file with DNA nucleotides and converts it to a string" do
    my_sequence = RNA.new("./rosalind_dna.txt")
    my_sequence.bases.is_a?(String).should == true
  end

  it "replaces 'T' nucleotides with 'U' nucleotides" do
    my_sequence = RNA.new("GATGGAACTTGACTACGTAAATT")
    my_sequence.dna_to_rna.should == "GAUGGAACUUGACUACGUAAAUU"
  end

  it "test if this is an RNA sequence by checking for 'U' nucleotides" do
    my_sequence = RNA.new("GAUGGAACUUGACUACGUAAAU")
    my_sequence.rna_bases?.should == true
  end
  it "tests if this is a DNA sequence by checking for 'T' nucleotides" do
    my_sequence = RNA.new("GATGGAACTTGACTACGTAAATT")
    my_sequence.dna_bases?.should == true
  end
end
