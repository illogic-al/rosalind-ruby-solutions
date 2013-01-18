#!/c/Ruby193/bin/ruby 
require_relative 'dna'

my_sequence = DNA.new(ARGV.first)

p my_sequence.dna_bases

puts "#{my_sequence.print_base_count}"
