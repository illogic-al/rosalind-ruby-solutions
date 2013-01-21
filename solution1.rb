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
    @nucleotides = %w( A C G T )
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

my_sequence = DNA.new(ARGV.first)

puts my_sequence.pretty_base_count
