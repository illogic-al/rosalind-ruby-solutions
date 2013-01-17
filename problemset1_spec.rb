require 'rspec'

  class DNA

    attr_reader :dna_bases, :result

    def initialize( sequence )
      @dna_bases = sequence
      @result = []
    end

    def count_bases
      # Create an array with our possible nucleotides
      nucleotides = %w( A C G T U )

      nucleotides.each do | a |
        result.push( @dna_bases.count a )
      end

     @result
    end

    def print_result
      puts "#{@result.join(" ")}"
    end
  end

describe DNA do
  my_sequence = DNA.new("AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC")

  it "takes an argument" do
    # TODO: Figure out how irb determines that an argument is missing
    # *args?
  end

  it "is a string" do
    my_sequence.dna_bases.is_a?( String ).should == true
  end

  it "gets input for nucleotides as a string" do
    my_sequence.dna_bases.should == "AGCTTTTCATTCTGACTGCAACGGGCAATATGTCTCTGTGTGGATTAAAAAAAGAGTGTCTGATAGCAGC"
  end

  it "gives a count of 'A' 'C' 'G' 'T' & 'U' in the sequence as an Array" do
    my_sequence.count_bases.should == [20, 12, 17, 21, 0]
  end

  it "returns the pretty printed results of the counted nucleotides in the order 'A C G T U'" do
    my_sequence.print_result.should == "20 12 17 21 0"
  end

  it "returns the # of 'A' nucleotides in the sequence" do
    my_sequence.result[0].should == 20
  end

  it "returns the # of 'C' nucleotides in the sequence" do
    my_sequence.result[1].should == 12
  end

  it "returns the # of 'G' nucleotides in the sequence" do
    my_sequence.result[2].should == 17
  end

  it "returns the # of 'T' nucleotides in the sequence" do
    my_sequence.result[3].should == 21
  end

  it "returns the # of 'U' nucleotides in the sequence" do
    my_sequence.result[4].should == 0
  end
end
