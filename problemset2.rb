require_relative 'lib/rna'

my_sequence = RNA.new(ARGV.first)

puts my_sequence.dna_to_rna
