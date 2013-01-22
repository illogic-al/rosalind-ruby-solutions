module Gandalf
  def self.the_validator(input)
    # We'll eat nummy newlines and other whitespace with 'strip' method
    # after testing them. Only the virtuous shall pass.

    if File.file?(input)
      input = File.read(input).strip
    end

    if input.is_a?(String) # die if we contain anything other than the values below
      if input.gsub(/[ACGTUNXacgtunx-]/, "").strip.empty?
        puts "Gandalf says:\n\t\"The board is set... the pieces are moving.\""
        input.strip
      else
        message = "You have characters that aren't valid nucleotides."
        message << "\nYou! Shall not! PAAAAAAAAAAAAAAAAAAAAAASS!"
        abort(message) 
      end
    end
  end
end

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

  def reverse_complement
    @dna_bases = Gandalf.the_validator(@dna_bases)

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

my_sequence = DNA.new(ARGV.first)

puts my_sequence.reverse_complement
