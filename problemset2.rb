require_relative 'rna'

my_sequence = RNA.new(ARGV.first)

puts my_sequence.dna_to_rna
