require_relative "lib/dna.rb"

my_sequence = DNA.new(ARGV.first)

puts my_sequence.reverse_complement
