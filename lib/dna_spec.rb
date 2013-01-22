require 'rspec'
require_relative 'gandalf'

class DNA
  attr_reader :nucleotides, :dna_bases, :result

  def initialize(sequence)
    @nucleotides = %w( A C G T )
    @dna_bases = sequence
    @result = []
  end

  def print_sequence
    @dna_bases
  end

  def print_bases
    print_sequence
  end

  def count_bases
    Gandalf.the_validator(@dna_bases)

    @nucleotides.each do |base|
      result.push( @dna_bases.count(base) )
    end

    @result
  end

  def pretty_base_count
    @result.join(" ")
  end

  def reverse_complement
    Gandalf.the_validator(@dna_bases)

    temp = @dna_bases.reverse.split(//)
    temp.each do |base|
      case base
      when 'A'
        base.gsub!('A', 'T')
      when 'C'
        base.gsub!('C', 'G')
      when 'G'
        base.gsub!('G', 'C')
      when 'T'
        base.gsub!('T', 'A')
      end
    end

    temp.join
  end
end

describe DNA do
  before do
    $stdout = StringIO.new
  end

  my_sequence = DNA.new("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")

  it "is a String" do
    my_sequence.dna_bases.is_a?(String).should == true
  end

  it "prints our input nucleotide sequence" do
    my_sequence.print_sequence.should == "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
  end

  it "also prints our input nucleotide sequence" do
    my_sequence.print_bases.should == "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
  end

  it "has an array of nucleotides" do
    my_sequence.nucleotides.is_a?(Array).should == true
  end

  it "returns an array of integers containing the number of 'A' 'C' 'G' 'T' & 'U' nucleotides, in that order" do
    my_sequence.count_bases.should == [20, 12, 17, 21]
  end

  it "has a string with nucleotides counts" do
    my_sequence.pretty_base_count.should == "20 12 17 21"
  end

  it "counts how many 'A' nucleotides are present" do
    my_sequence.result[0].should == 20
  end 

  it "counts how many 'C' nucleotides are present" do
    my_sequence.result[1].should == 12
  end

  it "counts how many 'G' nucleotides are present" do
    my_sequence.result[2].should == 17
  end

  it "counts how many 'T' nucleotides are present" do
    my_sequence.result[3].should == 21
  end

  it "gives us the reverse complement of the input sequence" do
    my_sequence = DNA.new("AAAACCCGGT")
    my_sequence.reverse_complement.should == "ACCGGGTTTT"
  end

end
