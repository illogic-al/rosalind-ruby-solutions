module Gandalf
  def self.the_validator(input)
    if File.file?(input)
      puts "Gandalf says:\n\t\"I've been sent back until my task is done.\""
      input = File.read(input)
    elsif input.is_a?(String)
      puts "Gandalf says:\n\t\"The board is set... the pieces are moving.\""
      input
    else
      message = "\"You are not a String! You are not a File!"
      message += "\n The dark fire will not avail you, unknown entity!"
      message += " Go back to the shadow."
      message += "\n YOU! SHALL NOT! PASS!\""
      abort(message) # we should never ever see this bit of ridiculousness
    end
  end
end

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


my_sequence = RNA.new(ARGV.first)

puts my_sequence.dna_to_rna
