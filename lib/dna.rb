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
